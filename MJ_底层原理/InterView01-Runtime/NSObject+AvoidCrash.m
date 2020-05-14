//
//  NSObject+AvoidCrash.m
//  InterView01-Runtime
//
//  Created by zainguo on 2020/4/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NSObject+AvoidCrash.h"

#import <objc/runtime.h>


@implementation NSObject (AvoidCrash)


void swizzleClassMethod(Class cls, SEL originSelector, SEL swizzleSelector){
    if (!cls) {
        return;
    }
    Method originalMethod = class_getClassMethod(cls, originSelector);
    Method swizzledMethod = class_getClassMethod(cls, swizzleSelector);
    
    Class metacls = objc_getMetaClass(NSStringFromClass(cls).UTF8String);
    if (class_addMethod(metacls,
                        originSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod)) ) {
        /* swizzing super class method, added if not exist */
        class_replaceMethod(metacls,
                            swizzleSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        /* swizzleMethod maybe belong to super */
        class_replaceMethod(metacls,
                            swizzleSelector,
                            class_replaceMethod(metacls,
                                                originSelector,
                                                method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod)),
                            method_getTypeEncoding(originalMethod));
    }
}

void swizzleInstanceMethod(Class cls, SEL originSelector, SEL swizzleSelector){
    if (!cls) {
        return;
    }
    /* if current class not exist selector, then get super*/
    Method originalMethod = class_getInstanceMethod(cls, originSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzleSelector);
    
    /* add selector if not exist, implement append with method */
    if (class_addMethod(cls,
                        originSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod)) ) {
        /* replace class instance method, added if selector not exist */
        /* for class cluster , it always add new selector here */
        class_replaceMethod(cls,
                            swizzleSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        /* swizzleMethod maybe belong to super */
        class_replaceMethod(cls,
                            swizzleSelector,
                            class_replaceMethod(cls,
                                                originSelector,
                                                method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod)),
                            method_getTypeEncoding(originalMethod));
    }
}

+ (void)load {
    //Class Method
    swizzleClassMethod([self class], @selector(methodSignatureForSelector:), @selector(classMethodSignatureForSelectorSwizzled:));
    swizzleClassMethod([self class], @selector(forwardInvocation:), @selector(forwardClassInvocationSwizzled:));
    
    //Instance Method
    swizzleInstanceMethod([self class], @selector(methodSignatureForSelector:), @selector(methodSignatureForSelectorSwizzled:));
    swizzleInstanceMethod([self class], @selector(forwardInvocation:), @selector(forwardInvocationSwizzled:));
}

//#pragma mark - 方法一
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if ([self respondsToSelector:aSelector]) {
//         return [self forwardingTargetForSelector:aSelector];
//    }
//    return [[NSObject alloc] init];
//}



#pragma mark - 方法二
- (NSMethodSignature *)methodSignatureForSelectorSwizzled:(SEL)aSelector {
    // 可以调用的方法
    NSMethodSignature *ms = [self methodSignatureForSelectorSwizzled:aSelector];
    if (ms) {
        return ms;
    }
    
//    if ([self respondsToSelector:aSelector]) {
//
//        return [self methodSignatureForSelector:aSelector];
//    }
    // 方法未实现
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
//    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
- (void)forwardInvocationSwizzled:(NSInvocation *)anInvocation {
    NSLog(@"找不到方法实现----------->%@", NSStringFromSelector(anInvocation.selector));
}
+ (NSMethodSignature *)classMethodSignatureForSelectorSwizzled:(SEL)aSelector {
    // 可以调用的方法
//    if ([self respondsToSelector:aSelector]) {
//        return [self methodSignatureForSelector:aSelector];
//    }
    NSMethodSignature *ms = [self classMethodSignatureForSelectorSwizzled:aSelector];
    if (ms) {
        return ms;
    }
    // 方法未实现
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
//    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
+ (void)forwardClassInvocationSwizzled:(NSInvocation *)anInvocation {
    NSLog(@"找不到方法实现----------->%@", NSStringFromSelector(anInvocation.selector));
}
@end
