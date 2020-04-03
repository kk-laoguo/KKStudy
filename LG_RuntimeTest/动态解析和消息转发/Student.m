//
//  Student.m
//  动态解析和消息转发
//
//  Created by zainguo on 2020/3/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Student.h"

@implementation Student
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
