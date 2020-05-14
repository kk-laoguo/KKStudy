//
//  Person.m
//  Interview01-Block的本质
//
//  Created by zainguo on 2020/4/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)test {
    
    void(^block)(void) = ^{
        NSLog(@"-----------%@", self.name);
    };
    block();

}
- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

@end
