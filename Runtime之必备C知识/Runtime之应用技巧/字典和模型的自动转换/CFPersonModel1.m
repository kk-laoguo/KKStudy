//
//  CFPersonModel.m
//  2字典和模型的自动转换
//
//  Created by GongCF on 2018/9/16.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPersonModel1.h"

@implementation CFPersonModel1
- (id)initWithDataDic:(NSDictionary *)data {
    self = [super initWithDataDic:data];
    if (self) {
        self.personId = data[@"id"];
    }
    return self;
}
@end
