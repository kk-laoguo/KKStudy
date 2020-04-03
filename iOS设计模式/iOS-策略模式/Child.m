//
//  Child.m
//  iOS-策略模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Child.h"
#import "EatVegetables.h"
#import "RunOneHour.h"

@implementation Child
- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"我是小孩");
        self.eat = [[EatVegetables alloc] init];
        self.run = [[RunOneHour alloc] init];
    }
    return self;
}

@end
