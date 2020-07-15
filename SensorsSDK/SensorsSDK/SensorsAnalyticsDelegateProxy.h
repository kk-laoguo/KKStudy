//
//  SensorsAnalyticsDelegateProxy.h
//  SensorsSDK
//
//  Created by zainguo on 2020/6/16.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SensorsAnalyticsDelegateProxy : NSProxy

+ (instancetype)proxyWithTableViewDelegate:(id<UITableViewDelegate>)delegate;


@end

