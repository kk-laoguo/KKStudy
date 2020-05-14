//
//  Student.m
//  InterView01-Runtime
//
//  Created by zainguo on 2020/4/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>


@implementation Student

- (void)run {
    NSLog(@"------>run");
}

/*

void avoidCrashMethodIMP(id self, SEL _cmd) {
    NSLog(@"赶紧去收集错误日志吧");
}


- (id)forwardingTargetForSelector:(SEL)aSelector {

    
    if ([self respondsToSelector:aSelector]) {
        return [super forwardingTargetForSelector:aSelector];
    }
//    return [[NSObject alloc] init];

    
     // 创建一个新类
    NSString *errClassName = NSStringFromClass([self class]);
    NSString *errSel = NSStringFromSelector(aSelector);
    
    NSLog(@"*** Crash Message: +[%@ %@]: unrecognized selector sent to class %p ***",errClassName, errSel, self);
    
    NSString *className = @"CrachClass";
    Class cls = NSClassFromString(@"CrashClass");
    if (!cls) {
        cls = objc_allocateClassPair([NSObject class], "CrashClass", 0);
        objc_registerClassPair(cls);
        
    }
    if (!class_getInstanceMethod(cls, aSelector)) {
        class_addMethod(cls, aSelector, (IMP)avoidCrashMethodIMP, "v@:");
    }
    return [[cls alloc] init];


    
//    // 如果类不存在 动态创建一个类
//    if (!cls) {
//        Class superClsss = [NSObject class];
//        cls = objc_allocateClassPair(superClsss, className.UTF8String, 0);
//        // 注册类
//        objc_registerClassPair(cls);
//    }
//    // 如果类没有对应的方法，则动态添加一个
//    if (!class_getInstanceMethod(NSClassFromString(className), aSelector)) {
//        class_addMethod(cls, aSelector, (IMP)avoidCrashMethodIMP, "v@:");
//    }
//    // 把消息转发到当前动态生成类的实例对象上
//    return [[cls alloc] init];
    
    
//    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

 */

@end
