//
//  ReduceCommand.m
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "ReduceCommand.h"
#import "Receive.h"

@interface ReduceCommand ()

@property (nonatomic, strong) Receive *receive;
@property (nonatomic, assign) CGFloat value;
@end

@implementation ReduceCommand

- (instancetype)initWithReceive:(Receive *)receive value:(CGFloat)value {
    if (self = [super init]) {
        self.receive = receive;
        self.value = value;
    }
    return self;
}
- (void)excute {
    [self.receive reduceView:self.value];
    
}
- (void)backExcute {
    [self.receive amplifyView:self.value];
}


@end
