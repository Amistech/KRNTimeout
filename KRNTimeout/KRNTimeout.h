//
//  KRNTimeout.h
//  
//
//  Created by Drapaylo Yulian on 01.07.16.
//  Copyright © 2016 Drapaylo Yulian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    KRNTimeoutStatusInitialized,
    KRNTimeoutStatusStarted,
    KRNTimeoutStatusStopped,
    KRNTimeoutStatusFired
} KRNTimeoutStatus;


@interface KRNTimeout : NSObject

- (instancetype)initWithSeconds:(NSTimeInterval)seconds; // use global queue for timeout
- (instancetype)initWithSeconds:(NSTimeInterval)seconds andQueue:(dispatch_queue_t)queue;
    
//allocate and start timeout immediately
+ (KRNTimeout *)timeoutWithSeconds:(NSTimeInterval)seconds queue:(dispatch_queue_t)queue andFiredBlock:(void (^)(void))firedBlock;
+ (KRNTimeout *)timeoutWithSeconds:(NSTimeInterval)seconds andFiredBlock:(void(^)(void))firedBlock;


@property (assign, nonatomic, readonly) NSTimeInterval seconds;  //seconds for timeout
@property (assign, atomic, readonly) KRNTimeoutStatus status; //current status of timeout

-(void) startWithBlock:(void(^)(void))firedBlock;  //block which called when timeout is expired
-(void) stop;  //stop timeout

@end
