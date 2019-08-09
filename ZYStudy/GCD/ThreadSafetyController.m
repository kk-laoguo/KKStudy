//
//  ThreadSafetyController.m
//  GCD
//
//  Created by zainguo on 2019/8/9.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "ThreadSafetyController.h"

@interface ThreadSafetyController (){
    dispatch_semaphore_t semaphoreLock;
}
@property (nonatomic, assign) NSInteger ticketSurplusCount;

@end

@implementation ThreadSafetyController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    [self semaphoreSync];
    
//    [self initTicketStatusNotSave];
//    [self initTicketStatusSafe];
    
    [self testDispatchSemaphore];
}
/**
 * semaphore 线程同步
 */
- (void)semaphoreSync {
    
    NSLog(@"currentThread-->%@",[NSThread currentThread]);
    NSLog(@"semaphore-->begin");
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block int number = 0;
    dispatch_async(queue, ^{
        // 追加任务1
        [NSThread sleepForTimeInterval:2];
        NSLog(@"1-->%@",[NSThread currentThread]);
        number = 100;
        NSLog(@"2-->%@ -->number = %d",[NSThread currentThread], number);
        dispatch_semaphore_signal(semaphore);
    });
    // 阻塞线程
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore-->end,number = %d",number);
}

/**
 * 非线程安全：不使用 semaphore
 * 初始化火车票数量、卖票窗口(非线程安全)、并开始卖票
 */
- (void)initTicketStatusNotSave {
    NSLog(@"currentThread-->%@",[NSThread currentThread]);
    NSLog(@"semaphore-->begin");
    self.ticketSurplusCount = 50;
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf saleTicketNotSafe];
    });
    dispatch_async(queue2, ^{
        [weakSelf saleTicketNotSafe];
    });
}
/**
 * 售卖火车票(非线程安全)
 */
- (void)saleTicketNotSafe {
    while (1) {
        //如果还有票，继续售卖
        if (self.ticketSurplusCount > 0) {
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%zd 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else {
            //如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            break;
        }
    }
}
/**
 * 线程安全：使用 semaphore 加锁
 * 初始化火车票数量、卖票窗口(线程安全)、并开始卖票
 */
- (void)initTicketStatusSafe {
    NSLog(@"currentThread---%@",[NSThread currentThread]);
    NSLog(@"semaphore---begin");
    semaphoreLock = dispatch_semaphore_create(1);
    self.ticketSurplusCount = 50;
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf saleTicketSafe];
    });
    
    dispatch_async(queue2, ^{
        [weakSelf saleTicketSafe];
    });
}
/**
 * 售卖火车票(线程安全)
 */
- (void)saleTicketSafe {
    while (1) {
        // 相当于加锁
        dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
        //如果还有票，继续售卖
        if (self.ticketSurplusCount > 0) {
            
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%zd 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else {
            //如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            // 相当于解锁
            dispatch_semaphore_signal(semaphoreLock);
            break;
        }
        // 相当于解锁
        dispatch_semaphore_signal(semaphoreLock);
    }
}
- (void)testDispatchSemaphore {
   /**
    *毫无疑问不使用dispatch_semaphore会产生异常
    *原因是：在多个线程中对mutableArray添加对象时，访问了同一块内存，产生了资源竞争。这时候大家都会想到加锁了
    *Dispatch Semaphore就可以完成这一功能。
    */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSMutableArray *mutableArray = [NSMutableArray array];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    // 当semaphore为0时，会一直等待semaphore大于或等于1；大于等于1时，将semaphore计数减1而不用等待；
    for (int i = 0; i < 100000; ++i) {
        dispatch_async(queue, ^{
            // 信号量计数减1
            //等待semaphore计数大于等于1，减1而不等待
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [mutableArray addObject:[NSNumber numberWithInt:i]];
            // 信号量计数加1
            //执行完后将semaphore计数加1
            dispatch_semaphore_signal(semaphore);
        });
    }
}
@end
