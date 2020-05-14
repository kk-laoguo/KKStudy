//
//  CXPermenantThread.h
//  CXResidentThread
//
//  Created by zainguo on 2020/4/15.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CXPermenantThread : NSObject


/*
 在当前子线程执行一个任务
 */
- (void)executeTask:(void(^)(void))task;
/*
 在当前子线程执行一个任务
 */
- (void)executeTaskWithTarget:(id)target selector:(SEL)selector;

/*
 结束线程
 */
- (void)stop;





@end

