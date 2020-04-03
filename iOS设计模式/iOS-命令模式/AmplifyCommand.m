//
//  AmplifyCommand.m
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "AmplifyCommand.h"
#import "Receive.h"

@interface AmplifyCommand ()

@property (nonatomic, strong) Receive *receiver;
@property (nonatomic, assign) CGFloat value;

@end

@implementation AmplifyCommand
- (instancetype)initWithReceive:(Receive *)receiver value:(CGFloat)value {
    if (self = [super init]) {
        self.receiver = receiver;
        self.value = value;
    }
    return self;
}


- (void)backExcute {
    [self.receiver reduceView:self.value];
}

- (void)excute {
    [self.receiver amplifyView:self.value];

}

@end
