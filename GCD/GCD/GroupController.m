//
//  GroupController.m
//  GCD
//
//  Created by zainguo on 2019/8/9.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "GroupController.h"

@interface GroupController ()

@end

@implementation GroupController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self groupNotify];
//    [self groupWait];
    [self groupEnterAndLeave];
}

/**
 * 队列组 dispatch_group_notify
 */
- (void)groupNotify {
    
    // 打印当前线程
    NSLog(@"currentThread-->%@",[NSThread currentThread]);
    NSLog(@"group-->begin");
    dispatch_group_t group =  dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1-->%@",[NSThread currentThread]);
        }
    });
    dispatch_group_async(group, queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2-->%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 等前面的异步任务1、任务2都执行完毕后，回到主线程执行下边任务
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3-->%@",[NSThread currentThread]);
        }
        NSLog(@"group-->end");
    });
}
/**
 * 队列组 dispatch_group_wait
 */
- (void)groupWait {
    
    NSLog(@"currentThread-->%@",[NSThread currentThread]);
    NSLog(@"group-->begin");
    dispatch_group_t group =  dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_group_async(group, queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1-->%@",[NSThread currentThread]);
        }
    });
    dispatch_group_async(group, queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2-->%@",[NSThread currentThread]);
        }
    });
    // 等待上面的任务全部完成后，会往下继续执行（会阻塞当前线程）
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"group-->end");
}

/**
 * 队列组 dispatch_group_enter、dispatch_group_leave
 */
- (void)groupEnterAndLeave {
    
    NSLog(@"currentThread-->%@",[NSThread currentThread]);
    NSLog(@"group-->begin");
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1-->%@",[NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2-->%@",[NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 等前面的异步操作都执行完毕后，回到主线程.
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3-->%@",[NSThread currentThread]);
        }
        NSLog(@"group_notify-->end");
    });
    // 等待上面的任务全部完成后，会往下继续执行（会阻塞当前线程）
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"group---end");
}


@end
