//
//  AudiCar.m
//  iOS-建造者模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "AudiCar.h"

@implementation AudiCar
- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"奥迪Q5";
        self.price = @"45万";
    }
    return self;
}
@end
