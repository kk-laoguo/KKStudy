//
//  KKStaticLib.m
//  KKStaticLib
//
//  Created by zainguo on 2020/6/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KKStaticLib.h"

@implementation KKStaticLib

+ (void)classMethod {
    NSLog(@"-----%s-----", __func__);
}
- (void)instanceMethod {
    NSLog(@"-----%s-----", __func__);
}

@end
