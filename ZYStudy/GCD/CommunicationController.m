//
//  CommunicationController.m
//  GCD
//
//  Created by zainguo on 2019/8/9.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CommunicationController.h"

@interface CommunicationController ()

@end

@implementation CommunicationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self communication];
//    [self barrier];
    
    [self apply];
}
/**
 * 线程间通信
 */
- (void)communication {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 异步追加任务
        for (int i = 0; i < 2; i ++) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1-->%@",[NSThread currentThread]);
        }
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2-->%@",[NSThread currentThread]);
        });
    });
}
/**
 * 栅栏方法 dispatch_barrier_async
 */
- (void)barrier {
    
    dispatch_queue_t queue = dispatch_queue_create("xxxx", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; i ++) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1--->%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2--->%@",[NSThread currentThread]);
        }
    });
    dispatch_barrier_async(queue, ^{
        // 追加任务 barrier
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"barrier--->%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3--->%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
         // 追加任务4
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"4--->%@",[NSThread currentThread]);
        }
    });
}
/**
 * 快速迭代方法 dispatch_apply
 */
- (void)apply {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"apply---begin");
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"%zd---%@",index, [NSThread currentThread]);

    });
    NSLog(@"apply---end");
}


@end
