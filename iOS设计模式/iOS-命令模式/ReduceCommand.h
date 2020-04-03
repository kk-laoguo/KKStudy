//
//  ReduceCommand.h
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommandProtocol.h"
@class Receive;
NS_ASSUME_NONNULL_BEGIN

@interface ReduceCommand : NSObject <CommandProtocol>

- (instancetype)initWithReceive:(Receive *)receive value:(CGFloat)value;


@end

NS_ASSUME_NONNULL_END
