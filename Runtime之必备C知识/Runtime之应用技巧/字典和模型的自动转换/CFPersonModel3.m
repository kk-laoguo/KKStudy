//
//  CFPersonModel3.m
//  2字典和模型的自动转换
//
//  Created by GongCF on 2018/9/16.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPersonModel3.h"

@implementation CFPersonModel3
- (NSString *)modelClassInPropertyArr:(NSString *)name {
    if ([name isEqualToString:@"students"]) {
        return NSStringFromClass([CFStudentModel class]);
    }
    return @"";
}

@end
