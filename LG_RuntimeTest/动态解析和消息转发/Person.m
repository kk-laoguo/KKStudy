//
//  Person.m
//  动态解析和消息转发
//
//  Created by zainguo on 2020/3/29.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Person.h"
#import "Student.h"

#import <objc/runtime.h>

@implementation Person

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@" ----- dynamicMethodIMP -----");
}
- (void)helloWord {
    NSLog(@"----- %s -----", __func__);
}

+ (void)readBook {
    NSLog(@"----- %s -----", __func__);
}
+ (void)superRun {
    NSLog(@"-------->%s", __func__);
}

#pragma mark - 实例方法 消息转发
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(eat)) {
//        // 这里我们将消息的接受者变成Student
//        return [Student new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(eat)) {
        // forwardingTargetForSelector 没有实现 就只能方法签名了
        // 方法一
//        Method method = class_getInstanceMethod(object_getClass(self), @selector(helloWord));
//        const char *type = method_getTypeEncoding(method);
//        return [NSMethodSignature signatureWithObjCTypes:type];
        
        // 方法二: 消息的接受者变成Student
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];

    }
    return [super methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    // 方法一
//    anInvocation.selector = @selector(helloWord);
//    // 调用
//    [anInvocation invoke];
    // 方法二
    // 修改消息的接受者
//    anInvocation.target = [[Student alloc] init];
    // 这里替换了SEL
//    anInvocation.selector = @selector(test);
//    [anInvocation invoke];
    // 和上面一样
    [anInvocation invokeWithTarget:[Student new]];
}

#pragma mark - 类方法消息转发

//+ (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(eat)) {
//        // 这里我们将消息的接受者变成Student
//        return [Student class];
//        // 发送给实例对象
////        return [[Student alloc] init];
//
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(eat)) {
        // forwardingTargetForSelector 没有实现 就只能方法签名了
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];

    }
    return [super methodSignatureForSelector:aSelector];
}
+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:[Student class]];
}



#pragma mark - 动态解析

// 实例方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"-------->%s", __func__);
//    if (sel == @selector(eat)) {
//        // C方法
//        // class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "@v:");
//        // OC方法
//        Method method = class_getInstanceMethod(self, @selector(helloWord));
//        const char *type = method_getTypeEncoding(method);
//        class_addMethod([self class], sel, method_getImplementation(method), type);
//
//        return YES;
//    }
//    return NO;
//}
// 类方法
//+ (BOOL)resolveClassMethod:(SEL)sel {
//    NSLog(@"-------->%s", __func__);
//      if (sel == @selector(eat)) {
//          // 类方法就存在我们的元类的方法列表, 所以可以通过获取元类的实例方法得到类方法
////          Method method = class_getClassMethod(self, @selector(readBook));
//          Method method = class_getInstanceMethod(object_getClass(self), @selector(readBook));
//          IMP imp = method_getImplementation(method);
//          const char *type = method_getTypeEncoding(method);
//          class_addMethod(object_getClass(self), sel, imp, type);
//          return YES;
//      }
//      return NO;
//}



@end

