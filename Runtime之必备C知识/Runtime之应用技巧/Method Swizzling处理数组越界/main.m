//
//  main.m
//  Method Swizzling处理数组越界
//
//  Created by zainguo on 2019/7/10.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+Category.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSArray *arr = @[@1,@2];
        NSLog(@"[arr objectAtIndex:2]：%@",[arr objectAtIndex:2]);
        NSLog(@"第一次交换====================");
        NSLog(@"originalIMP1：%p", [arr methodForSelector:@selector(objectAtIndex:)]);
        NSLog(@"swizzledIMP1：%p", [arr methodForSelector:@selector(cf_objectAtIndex:)]);
        [NSArray load];
        NSLog(@"[arr objectAtIndex:2]：%@",[arr objectAtIndex:2]);
        NSLog(@"第二次交换====================");
        NSLog(@"originalIMP2：%p", [arr methodForSelector:@selector(objectAtIndex:)]);
        NSLog(@"swizzledIMP2：%p", [arr methodForSelector:@selector(cf_objectAtIndex:)]);

    }
    
    
    return 0;
}
