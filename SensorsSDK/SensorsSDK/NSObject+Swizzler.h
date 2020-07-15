//
//  NSObject+Swizzler.h
//  SensorsSDK
//
//  Created by zainguo on 2020/6/15.
//  Copyright © 2020 zainguo. All rights reserved.
//



#import <Foundation/Foundation.h>


@interface NSObject (Swizzler)

void yx_swizzleInstanceMethod(Class cls, SEL originSelector, SEL swizzleSelector);

@end

