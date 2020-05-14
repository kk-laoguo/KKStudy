//
//  NSTimer+LGSafeTimer.m
//  Timer强引用问题
//
//  Created by zainguo on 2020/4/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NSTimer+LGSafeTimer.h"



@implementation NSTimer (LGSafeTimer)

+ (NSTimer *)lg_scheduledTimerWithTimeInterval:(NSTimeInterval)timerinterval
                                       repeats:(BOOL)repeats
                                         block:(void (^)(void))block {
    return [NSTimer scheduledTimerWithTimeInterval:timerinterval
                                            target:self
                                          selector:@selector(__fun:)
                                          userInfo:[block copy]
                                           repeats:repeats];
    
}

+ (void)__fun:(NSTimer *)timer {
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
