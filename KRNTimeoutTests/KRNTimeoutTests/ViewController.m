//
//  ViewController.m
//  KRNTimeoutTests
//
//  Created by ulian_onua on 03.10.16.
//  Copyright © 2016 ulian_onua. All rights reserved.
//

#import "ViewController.h"
#import "KRNTimeout.h"



@interface ViewController ()
   // @property (strong, nonatomic) KRNTimeout *timeout;
    @property (strong, nonatomic) dispatch_queue_t serialQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"View did load");
//    
//    _serialQueue = dispatch_queue_create("kornet.serialQueue.com", DISPATCH_QUEUE_SERIAL);
//    
//    KRNTimeout *timeout = [[KRNTimeout alloc]initWithSeconds:2.f];
//    [timeout startWithBlock:^{
//        NSLog(@"FGG");
//    }];
  
    
//    KRNTimeout *timeout = [KRNTimeout timeoutWithSeconds:2.f andFiredBlock:^{
//        NSLog(@"Timeout is expired");
//    }];
//    [timeout stop];
//    
//    
//    KRNTimeout *timeou3 = [KRNTimeout timeoutWithSeconds:2.f andFiredBlock:^{
//        NSLog(@"Timeout 3 is expired");
//    }];
//    [timeou3 startWithBlock:^{
//        NSLog(@"GG");
//    }];
//    [timeout stop];
//    KRNTimeout *timeout4 = [KRNTimeout timeoutWithSeconds:2.f andFiredBlock:^{
//        NSLog(@"Timeout 4 is expired");
//    }];
//    [timeout stop];
//    KRNTimeout *timeou5 = [KRNTimeout timeoutWithSeconds:2.f andFiredBlock:^{
//        NSLog(@"Timeout 5 is expired");
//    }];
//    [timeout stop];
//    KRNTimeout *timeou6 = [KRNTimeout timeoutWithSeconds:2.f andFiredBlock:^{
//        NSLog(@"Timeout 6 is expired");
   // }];
 //   //[timeout stop];
    
  //  timeout = nil;
   //   timeout = nil;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        timeout = nil;
//    });
    

    
//    _timeout = [[KRNTimeout alloc]initWithSeconds:2.f andQueue:_serialQueue];
//    [_timeout startWithBlock:^{
//        NSLog(@"Timeout is expired");
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
