//
//  LGSafeTimer.m
//  Timer强引用问题
//
//  Created by zainguo on 2020/4/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "LGSafeTimer.h"

@interface LGSafeTimer ()

@property (nonatomic, weak) id target;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) SEL selector;



@end

@implementation LGSafeTimer


+ (LGSafeTimer *)lg_scheduledTimerWithTimeInterval:(NSTimeInterval)timerinterval
                                           target:(id)aTarget
                                         selector:(SEL)aSelector
                                         userInfo:(id)userInfo
                                          repeats:(BOOL)repeats {
    LGSafeTimer *timer = [[LGSafeTimer alloc] scheduledTimerWithTimeInterval:timerinterval
                                                                      target:aTarget
                                                                    selector:aSelector
                                                                    userInfo:userInfo
                                                                     repeats:repeats];
    return timer;
}

- (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)timerinterval
                                        target:(id)aTarget
                                      selector:(SEL)aSelector
                                      userInfo:(id)userInfo
                                       repeats:(BOOL)repeats {
    if (self == [super init]) {
        self.target = aTarget;
        self.selector = aSelector;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:timerinterval
                                                      target:self
                                                    selector:@selector(lg_safeTimerRun)
                                                    userInfo:userInfo
                                                     repeats:repeats];
        
    }
    return self;
}

- (void)lg_inValidate {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)dealloc {
    NSLog(@"%@ --- %s", self, __func__);
}

#pragma mark - Private Methods

- (void)lg_safeTimerRun {
   
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector];
    }
#pragma clang diagnostic pop

}
@end
