//
//  KRNTimeoutTestsTests.m
//  KRNTimeoutTestsTests
//
//  Created by ulian_onua on 03.10.16.
//  Copyright © 2016 ulian_onua. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KRNTimeout.h"

@interface KRNTimeoutTestsTests : XCTestCase

@end

@implementation KRNTimeoutTestsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
    


- (void)testTimeoutAllocation {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"TimeoutExpectation"];
    
    KRNTimeout *timeout = [[KRNTimeout alloc]initWithSeconds:2.f];
    [timeout startWithBlock:^{
        [expectation fulfill];
    }];
    
   // [timeout stop];
    
    XCTestExpectation *expectation2 = [self expectationWithDescription:@"TimeoutExpectation2"];
    dispatch_queue_t serialQueue = dispatch_queue_create("com.SerialQueue.krn", DISPATCH_QUEUE_SERIAL);
    KRNTimeout *timeout2 = [[KRNTimeout alloc]initWithSeconds:2.f andQueue:serialQueue];
    
    [timeout2 startWithBlock:^{
        [expectation2 fulfill];
    }];
    
    XCTestExpectation *expectation3 = [self expectationWithDescription:@"TimeoutExpectation3"];

    [KRNTimeout timeoutWithSeconds:2.f andFiredBlock:^{
        [expectation3 fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2.05 handler:^(NSError * _Nullable error) {
    }];
    
}

- (void)testTimeoutStability {
    
    //try start timer simultaneously from different queues
    KRNTimeout *timeout = [[KRNTimeout alloc]initWithSeconds:2.f];
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.SerialQueue.krn", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t serialQueue2 = dispatch_queue_create("com.SerialQueue2.krn", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t serialQueue3 = dispatch_queue_create("com.SerialQueue2.krn", DISPATCH_QUEUE_SERIAL);
    
    __block int i = 0;
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"TimeoutExpectation"];

    
    dispatch_async(serialQueue, ^{
       [timeout startWithBlock:^{
           NSLog(@"Block");
           i++;
           [expectation fulfill];

       }];
    });
    dispatch_async(serialQueue2, ^{
        [timeout startWithBlock:^{
            NSLog(@"Block2");
            i++;
            [expectation fulfill];

        }];
    });
    
    dispatch_async(serialQueue3, ^{
        [timeout startWithBlock:^{
            NSLog(@"Block2");
            i++;
            [expectation fulfill];

        }];
    });
    
    
    [self waitForExpectationsWithTimeout:2.05 handler:^(NSError * _Nullable error) {
        XCTAssertEqual(i, 1);
    }];

}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
