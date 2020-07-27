//
//  NSArray+Category.m
//  Method Swizzling处理数组越界
//
//  Created by zainguo on 2019/7/10.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "NSArray+Category.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSArray (Category)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(cf_objectAtIndex:)];
    });

}
- (id)cf_objectAtIndex:(NSUInteger)index {
    
    if(index > self.count-1) {
        NSLog(@"数组越界了！");
        return nil;
    } else {
        return [self cf_objectAtIndex:index];
    }
}

@end
