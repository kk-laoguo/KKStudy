//
//  NSObject+YXLeaks.m
//  MemeoryLeakTool
//
//  Created by zainguo on 2020/3/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NSObject+YXLeaks.h"
#import <objc/runtime.h>


@implementation NSObject (YXLeaks)

- (void)yx_willDealloc {
    
    __weak typeof(self) weakSelf = self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(self) strongSelf = weakSelf;
            NSLog(@"来了");
            [strongSelf assertNotDealloc];
        });
    });
}

- (void)assertNotDealloc {
    NSLog(@"Leaks--------->%@", NSStringFromClass([self class]));
}
+ (void)yx_swizzleOriginalInstanceMethod:(SEL)originalSEL withTargetInstanceMethod:(SEL)swizzledSEL {
    
    Class cls = [self class];
    Method originalMethod = class_getInstanceMethod(cls, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSEL);
    
    
    BOOL didAddMethod = class_addMethod(cls, originalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));

    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
