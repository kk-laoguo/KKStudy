//
//  ViewController.m
//  iOS-生产消费者
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//  https://ityongzhen.github.io/iOS设计模式之(二)生产者-消费者.html

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [NSMutableArray array];
    _semaphore = dispatch_semaphore_create(1);
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(producerFuncWithNumber:) userInfo:nil repeats:YES];
    
    [self consumer];
    
}
- (IBAction)amplifyAction:(id)sender {
}
- (void)producerFuncWithNumber:(NSInteger)number {
    
    number = random() % 10;
    // 生产者生成数据
    dispatch_queue_t queue = dispatch_queue_create("xxx", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        [self.array addObject:@(number)];
        NSLog(@"生产了%lu 个",(unsigned long)self.array.count);
        dispatch_semaphore_signal(self.semaphore);
    });

}
- (void)consumer {
    
    dispatch_queue_t queue = dispatch_queue_create("xxx", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        while (1) {
            if (self.array.count > 0) {
                dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
                NSLog(@"消费了%lu个", self.array.count);
                [self.array removeAllObjects];
                [self reload];
                dispatch_semaphore_signal(self.semaphore);
            }
        }
    });
}

- (void)reload{
    NSLog(@"休眠2秒");
    sleep(2);
}

@end
