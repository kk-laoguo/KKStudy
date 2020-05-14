//
//  LGSafeTimer.h
//  Timer强引用问题
//
//  Created by zainguo on 2020/4/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LGSafeTimer : NSObject

+ (LGSafeTimer *)lg_scheduledTimerWithTimeInterval:(NSTimeInterval)timerinterval
                                 target:(id)aTarget
                               selector:(SEL)aSelector
                               userInfo:(id)userInfo
                                repeats:(BOOL)repeats;
- (void)lg_inValidate;


@end

