//
//  OldMan.m
//  iOS-策略模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "OldMan.h"
#import "RunTwoHour.h"
#import "EatVegetables.h"

@implementation OldMan

- (instancetype)init {
    if (self = [super init]) {
        self.eat = [EatVegetables new];
        self.run = [RunTwoHour new];
        NSLog(@"我是老人");
    }
    return self;
}

@end
