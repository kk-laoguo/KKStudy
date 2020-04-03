//
//  BMWCar.m
//  iOS-建造者模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "BMWCar.h"

@implementation BMWCar

- (instancetype)init {
    if (self = [super init]) {
        self.name = @"宝马740Li";
        self.price = @"98万";
    }
    return self;
}

@end
