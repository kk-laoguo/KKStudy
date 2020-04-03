//
//  NSObject+Runtime.h
//  Initiallize
//
//  Created by zainguo on 2020/1/16.
//  Copyright © 2020 zainguo. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Runtime)


/**
 获取对象的所有方法列表
 如果要获取当前类的类方法列表: [object_getClass([xxx class]) yx_getAllMethods];
 */
+ (NSArray *)yx_getAllMethods;
/**
 获取对象的所有属性
 */
+ (NSArray *)yx_getAllProperties;
/**
 获取对象的所有成员变量
 */
+ (NSArray *)yx_getAllIvarList;
/**
 获取协议列表
 */
+ (NSArray *)yx_getAllProtocolList;

/**
 方法交换
 */
+ (void)yx_swizzleOriginalInstanceMethod:(SEL)originalSEL withTargetInstanceMethod:(SEL)swizzledSEL;



@end

NS_ASSUME_NONNULL_END
