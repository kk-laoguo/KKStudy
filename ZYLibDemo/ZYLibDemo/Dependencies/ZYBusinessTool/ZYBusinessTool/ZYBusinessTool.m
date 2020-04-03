//
//  ZYBusinessTool.m
//  ZYBusinessTool
//
//  Created by zainguo on 2020/3/25.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ZYBusinessTool.h"
#import "ZYNetworkManager.h"

@implementation ZYBusinessTool

+ (void)getHomeData {
    [ZYNetworkManager loadData];
} 


@end
