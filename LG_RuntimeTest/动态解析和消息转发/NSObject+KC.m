//
//  NSObject+KC.m
//  动态解析和消息转发
//
//  Created by zainguo on 2020/3/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NSObject+KC.h"

#import <AppKit/AppKit.h>


@implementation NSObject (KC)
+ (void)run {
    NSLog(@"--------->%s", __func__);
}

- (void)walk {
    NSLog(@"--------->%s", __func__);
}
- (void)instanceFunc {
    NSLog(@"--------->%s", __func__);
}

 
@end
