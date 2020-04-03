//
//  Person.m
//  iOS-策略模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)eatSomeThing {
    [self.eat eatSomeThing];
}
- (void)runEveryDay {
    [self.run runEveryDay];
}

@end
