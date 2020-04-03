//
//  Invoker.h
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"

@interface Invoker : NSObject

+ (instancetype)sharedInstance;
- (void)excute:(id<CommandProtocol>)command;
- (void)rollBack;
@end

