//
//  CommandProtocol.h
//  iOS-命令模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//;


#import <Foundation/Foundation.h>

@protocol CommandProtocol <NSObject>

/// 执行命令
- (void)excute;
/// 撤销命令
- (void)backExcute;

@end


