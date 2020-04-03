//
//  Adult.m
//  iOS-策略模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Adult.h"
#import "EatMeat.h"
#import "RunTwoHour.h"

@implementation Adult

- (instancetype)init {
    if (self = [super init]) {
        self.eat = [EatMeat new];
        self.run = [RunTwoHour new];
        NSLog(@"我是大人");
    }
    return self;
}

@end
