//
//  Invoker.m
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Invoker.h"

@interface Invoker ()

@property (nonatomic, strong) NSMutableArray *commandArr;

@end

@implementation Invoker
+ (instancetype)sharedInstance {
    
    static Invoker *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[Invoker alloc] init];
        _instance.commandArr = [NSMutableArray array];
        
    });
    return _instance;
}
- (void)excute:(id<CommandProtocol>)command {
    
    [self.commandArr addObject:command];
    [command excute];
}

- (void)rollBack {
    
    id<CommandProtocol> command = self.commandArr.lastObject;
    [command backExcute];
    [self.commandArr removeLastObject];
}

@end
