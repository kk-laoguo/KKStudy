//
//  NSObject+YXLeaks.h
//  MemeoryLeakTool
//
//  Created by zainguo on 2020/3/19.
//  Copyright © 2020 zainguo. All rights reserved.
//



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YXLeaks)

/**
 方法交换
 */
+ (void)yx_swizzleOriginalInstanceMethod:(SEL)originalSEL withTargetInstanceMethod:(SEL)swizzledSEL;

- (void)yx_willDealloc;


@end

NS_ASSUME_NONNULL_END
