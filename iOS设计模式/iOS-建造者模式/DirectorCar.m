//
//  DirectorCar.m
//  iOS-建造者模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "DirectorCar.h"

@implementation DirectorCar
+ (BuilderCar *)createBuilderCar:(BuilderCar *)builderCar {
    BuilderCar *car = [builderCar makerCar];
    return car;
}
@end
