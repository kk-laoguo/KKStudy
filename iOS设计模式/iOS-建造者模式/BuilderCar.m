//
//  BuilderCar.m
//  iOS-建造者模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "BuilderCar.h"

@implementation BuilderCar

- (NSString *)description {
    return [NSString stringWithFormat:@"我是一辆: %@车 价格: %@", self.name, self.price];
}
- (BuilderCar *)makerCar {
    BuilderCar *car = [[BuilderCar alloc] init];
    car.name = self.name;
    car.price = self.price;
    return car;
}

@end
