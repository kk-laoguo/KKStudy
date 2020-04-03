//
//  NSObject+Runtime.m
//  Initiallize
//
//  Created by zainguo on 2020/1/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>


@implementation NSObject (Runtime)

+ (NSArray *)yx_getAllMethods {
    
    unsigned int count;
    // 获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    NSMutableArray *methodsArr = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        [methodsArr addObject:methodName];
    }
    free(methodList);
    return methodsArr;
}

+ (NSArray *)yx_getAllProperties {
    
    unsigned int count;
    // 获取属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArr = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        // 获取属性
        const char* propertyName = property_getName(properties[i]);
        [propertiesArr addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(properties);
    return propertiesArr;
}
+ (NSArray *)yx_getAllIvarList {
    
    unsigned int count;
    // 获取成员变量列表
    Ivar *ivars = class_copyIvarList([self class], &count);
    NSMutableArray *ivarArr = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        // 获取成员变量
        const char* ivarName = ivar_getName(ivars[i]);
        [ivarArr addObject:[NSString stringWithUTF8String:ivarName]];
    }
    free(ivars);
    return ivarArr;
}
+ (NSArray *)yx_getAllProtocolList {
    
    unsigned int count;
    // 获取属性类表
    __unsafe_unretained Protocol **protocols = class_copyProtocolList([self class], &count);
    NSMutableArray *protocolArr = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        const char* protocolName = protocol_getName(protocols[i]);
        [protocolArr addObject:[NSString stringWithUTF8String:protocolName]];
    }
    free(protocols);
    return protocolArr;
}

/* 获取对象的所有属性和属性内容 */
+ (NSDictionary *)getAllPropertiesAndVaules:(NSObject *)obj {
    
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionary];
    unsigned int outCount;
    objc_property_t *properties =class_copyPropertyList([obj class], &outCount);
    for ( int i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [obj valueForKey:(NSString *)propertyName];
        if (propertyValue) {
            [propsDic setObject:propertyValue forKey:propertyName];
        }
    }
    free(properties);
    return propsDic;
}

+ (void)yx_swizzleOriginalInstanceMethod:(SEL)originalSEL withTargetInstanceMethod:(SEL)swizzledSEL {

    Class cls = [self class];
    Method originalMethod = class_getInstanceMethod(cls, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSEL);
    // class_addMethod() 函数返回成功表示被交换的方法没实现，然后会通过 class_addMethod() 函数先实现;
    // 返回失败则表示被交换的方法有实现
    BOOL didAddMethod = class_addMethod(cls, originalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        
        class_replaceMethod(cls, swizzledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}


@end
