//
//  NSObject+Swizzling.m
//  Method Swizzling处理数组越界
//
//  Created by zainguo on 2019/7/10.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+ (void)swizzleMethod:(SEL)originalSel withMethod:(SEL)swizzledSel {
    /*
     *1.获取originalSel、swizzledSel的method
     */
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    if (!originalSel) {
        NSLog(@"original method:%@ not found!",NSStringFromSelector(originalSel));
        return;
    }
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSel);
    if (!swizzledMethod) {
        NSLog(@"swizzledMethod method:%@ not found!",NSStringFromSelector(swizzledSel));
        return;
    }
    /*
     *2.为了避免影响到父类的方法，添加方法
     */
    class_addMethod(self, originalSel, class_getMethodImplementation(self, originalSel), method_getTypeEncoding(originalMethod));
    class_addMethod(self, swizzledSel, class_getMethodImplementation(self, swizzledSel), method_getTypeEncoding(swizzledMethod));
    /*
     *3.交换方法实现
     */
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
}

@end
