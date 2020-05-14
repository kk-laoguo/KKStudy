//
//  Man.m
//  InterView01-Runtime
//
//  Created by zainguo on 2020/4/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Man.h"

#import "AvoidProxy.h"

#import <objc/runtime.h>

@implementation Man

// 帮我们自动生成setter和getter方法的实现
// 指定成员变量名为 _age
//@synthesize age = _age;
@dynamic age;


- (void)test {
    NSLog(@"------>消息转发来了");
}

#pragma mark - 防奔溃
#pragma mark - 方式一: 给未实现的实例方法动态添加
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSMethodSignature *sign = [self methodSignatureForSelector:sel];
//    if (!sign) {
//        // 动态添加方法
////        @encode(int)
//        Method method = class_getInstanceMethod([self class], @selector(test));
//        class_addMethod([self class], sel, method_getImplementation(method), "v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
#pragma mark - 方式二:

//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if ([self respondsToSelector:aSelector]) {
//        return [super forwardingTargetForSelector:aSelector];
//    }
//    AvoidProxy *proxy = [AvoidProxy alloc];
//    Method method = class_getInstanceMethod([self class], @selector(test));
//    class_addMethod([proxy class], aSelector, method_getImplementation(method), "v@:");
//    return proxy;
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    // 可以调用的方法
    if ([self respondsToSelector:aSelector]) {
        return [super methodSignatureForSelector:aSelector];
    }
    // 方法未实现
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
//    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"找不到方法实现----------->%@", NSStringFromSelector(anInvocation.selector));
}
@end
