//
//  CQDevContext.h
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQUrlContext : NSObject<NSCoding>

@property (nonatomic, strong) NSString *url;//地址

@property (nonatomic, strong) NSString *devTitle;//环境名称

@end
