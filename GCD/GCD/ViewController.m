//
//  ViewController.m
//  ZYStudy
//
//  Created by zainguo on 2019/8/9.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) dispatch_queue_t serialQueue;
@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)GCDtest {
    // 串行对别
    self.serialQueue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    // 并发队列
    self.concurrentQueue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    // 主队列的获取方法
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    // 全局并发队列的获取方法
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 同步执行 + 并发队列
    //    [self syncConcurrent];
    // 异步执行 + 并发队列
    //    [self asyncConcurrent];
    // 同步执行 + 串行队列
    //    [self syncSerial];
    
    // 异步执行 + 串行队列
    //    [self asyncSerial];
    
    // 同步执行 + 主队列
    //    [self syncMain];
    // 同步执行 + 主队列 + 子线程
    //    [NSThread detachNewThreadSelector:@selector(syncMain) toTarget:self withObject:nil];
    
    // 异步执行 + 主队列
    //    [self asyncMain];
    
//    [self deadlock2];
    
}
/**
 * 同步执行 + 并发队列
 * 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。
 */
- (void)syncConcurrent {
    
    // 打印当前线程
    NSLog(@"currentThread--->%@",[NSThread currentThread]);
    NSLog(@"--->begin");
    dispatch_sync(self.concurrentQueue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1--->%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(self.concurrentQueue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2--->%@",[NSThread currentThread]);
        }
    });
    NSLog(@"--->end");
}
/**
 * 异步执行 + 并发队列
 * 特点：可以开启多个线程, 任务交替 (同时) 执行。
 */
- (void)asyncConcurrent {
    // 打印当前线程
    NSLog(@"currentThread--->%@",[NSThread currentThread]);
    NSLog(@"--->>begin");
    dispatch_async(self.concurrentQueue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1--->%@",[NSThread currentThread]);
        }
    });
    dispatch_async(self.concurrentQueue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2--->%@",[NSThread currentThread]);
        }
    });
    NSLog(@"--->end");
}
/*
 * 同步执行 + 串行队列
 * 特点: 不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务。
 */
- (void)syncSerial {
    // 打印当前线程
    NSLog(@"currentThread--->%@",[NSThread currentThread]);
    NSLog(@"--->begin");
    dispatch_sync(self.serialQueue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1--->%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(self.serialQueue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2--->%@",[NSThread currentThread]);
        }
    });
    NSLog(@"--->end");
}
/**
 * 异步执行 + 串行队列
 * 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
 */
- (void)asyncSerial {
    // 打印当前线程
    NSLog(@"currentThread--->%@",[NSThread currentThread]);
    NSLog(@"--->begin");
    dispatch_async(self.serialQueue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1--->%@",[NSThread currentThread]);
        }
    });
    dispatch_async(self.serialQueue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2--->%@",[NSThread currentThread]);
        }
    });
    NSLog(@"--->end");
}
/**
 * 异步执行 + 主队列
 * 特点：只在主线程中执行任务，执行完一个任务，再执行下一个任务
 */
- (void)asyncMain {
    // 打印当前线程
    NSLog(@"currentThread--->%@",[NSThread currentThread]);
    NSLog(@"--->begin");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1--->%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2--->%@",[NSThread currentThread]);
        }
    });
    NSLog(@"--->end");
}
/**
 * 同步执行 + 主队列
 * 特点(主线程调用)：互等卡主不执行。
 * 特点(其他线程调用)：不会开启新线程，执行完一个任务，再执行下一个任务。
 */
- (void)syncMain {
    // 打印当前线程
    NSLog(@"currentThread--->%@",[NSThread currentThread]);
    NSLog(@"--->begin");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1--->%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2--->%@",[NSThread currentThread]);
        }
    });
    NSLog(@"--->end");
    
    
}
#pragma mark - 死锁
// 主线程中使用 同步执行 + 主队列*
- (void)deadlock1 {
    NSLog(@"currentThread--->%@",[NSThread currentThread]);
    dispatch_sync(dispatch_get_main_queue(), ^{
        for (int i = 0; i < 2; ++i) {
            // 打印当前线程
            NSLog(@"1--->%@",[NSThread currentThread]);
        }
    });
    NSLog(@"--->end");
    
}
// 串行异步嵌套同步(当前线程是主线程还是子线程都一样)
- (void)deadlock2 {
    
    NSLog(@"currentThread--->%@",[NSThread currentThread]);
    dispatch_async(self.serialQueue, ^{
        NSLog(@"1--->%@",[NSThread currentThread]);
        dispatch_sync(self.serialQueue, ^{
            NSLog(@"2--->%@",[NSThread currentThread]);
        });
        NSLog(@"3--->%@",[NSThread currentThread]);
    });
    NSLog(@"--->end");
}


@end

