//
//  Student.m
//  动态解析和消息转发
//
//  Created by zainguo on 2020/3/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Student.h"

@interface Student () {
    dispatch_queue_t _concurrent_queue;
    NSMutableDictionary *_dic;
}


@end

@implementation Student
- (instancetype)init {
    if (self = [super init]) {
        _concurrent_queue = dispatch_queue_create("read_write_queue", DISPATCH_QUEUE_CONCURRENT);
        _dic = [NSMutableDictionary dictionary];
        for (NSInteger i = 0; i < 30; i ++) {
            [self objctForKey:nil];
        }
        
    }
    return self;
}
- (id)objctForKey:(NSString *)key {
    
    dispatch_async(_concurrent_queue, ^{
        NSLog(@"读-----");
    });
    return nil;
    
}
- (void)write {
    dispatch_barrier_async(_concurrent_queue, ^{
        NSLog(@"写-----");

    });
}
+ (void)superRun {
    NSLog(@"-------->%s", __func__);
}
- (void)eat {
    NSLog(@"Student ---> %s", __func__);
}
+ (void)eat {
    NSLog(@"Student ---> %s", __func__);
}
- (void)test {
    NSLog(@"Student ---> %s", __func__);
}


@end
