//
//  NSTimer+LGSafeTimer.h
//  Timer强引用问题
//
//  Created by zainguo on 2020/4/26.
//  Copyright © 2020 zainguo. All rights reserved.
//



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (LGSafeTimer)

+ (NSTimer *)lg_scheduledTimerWithTimeInterval:(NSTimeInterval)timerinterval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(void))block;



@end

NS_ASSUME_NONNULL_END
