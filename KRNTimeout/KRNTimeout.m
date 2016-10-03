//
//  KRNTimeout.h
//  
//
//  Created by Drapaylo Yulian on 01.07.16.
//  Copyright © 2016 Drapaylo Yulian. All rights reserved.
//

#import "KRNTimeout.h"
#include <pthread.h>

@interface KRNTimeout()

@property (strong, nonatomic) dispatch_queue_t queue;
@property (strong, nonatomic) void(^firedBlock)(void);  //block which called when timeout is expired
    
@property (assign, atomic, readwrite) KRNTimeoutStatus status; //current status of timeout

@property (assign, nonatomic) pthread_mutex_t mutex;


@end

@implementation KRNTimeout


- (instancetype)init
{
    return [self initWithSeconds:10.f]; //by default - 10 seconds
}

- (instancetype)initWithSeconds:(NSTimeInterval)seconds{
    return [self initWithSeconds:seconds andQueue:nil];
}
    
- (instancetype)initWithSeconds:(NSTimeInterval)seconds andQueue:(dispatch_queue_t)queue {
    self = [super init];
    if (self) {
        _status = KRNTimeoutStatusInitialized;
        _seconds = (seconds > 0 ) ? seconds : 10.f;  //if seconds is incorrent use default value
        _queue = (queue != nil) ? queue : dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); // if queue is nil use global queue
        pthread_mutex_init(&_mutex, NULL);
        
        
    }
    return self;
}
    
+ (KRNTimeout *)timeoutWithSeconds:(NSTimeInterval)seconds queue:(dispatch_queue_t)queue andFiredBlock:(void (^)(void))firedBlock {
    KRNTimeout *timeout = [[KRNTimeout alloc]initWithSeconds:seconds andQueue:queue];
    [timeout startWithBlock:firedBlock];
    return timeout;
}
    
+ (KRNTimeout *)timeoutWithSeconds:(NSTimeInterval)seconds andFiredBlock:(void(^)(void))firedBlock {
    return [self timeoutWithSeconds:seconds queue:nil andFiredBlock:firedBlock];
}


-(void) startWithBlock:(void(^)(void))firedBlock  //block
{
    pthread_mutex_lock(&_mutex);  //prevent from starting from different threads
    if (_status != KRNTimeoutStatusStarted) {
        _firedBlock = firedBlock;
        
        NSLog(@"Started");
        
      //  _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queueForTimer);
        typeof(self) weakSelf = self;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_seconds * NSEC_PER_SEC)), _queue, ^{
        if (_status != KRNTimeoutStatusStopped)
            if (weakSelf.firedBlock) {
                weakSelf.firedBlock();
                weakSelf.status = KRNTimeoutStatusFired;
            }
        });
        
    
        _status = KRNTimeoutStatusStarted;
    }
    pthread_mutex_unlock(&_mutex);
}

- (void)stop
{
    pthread_mutex_lock(&_mutex);
    if (_status == KRNTimeoutStatusStarted) {
        _status = KRNTimeoutStatusStopped;
    }
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc {

    _status = KRNTimeoutStatusStopped;
    pthread_mutex_destroy(&_mutex);
    NSLog(@"Deallocated");
}



@end
