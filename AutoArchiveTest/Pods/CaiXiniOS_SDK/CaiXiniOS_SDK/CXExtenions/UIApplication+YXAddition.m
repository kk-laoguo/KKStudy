//
//  UIApplication+YXAddition.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UIApplication+YXAddition.h"

@implementation UIApplication (YXAddition)

/**
 高亮
 */
+ (void)yx_lightStatusBar {
    [self sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

/**
 黑色
 */
+ (void)yx_darkStatusBar {
    
    [self sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

/**
 状态栏隐藏状态
 @param hidden hidden description
 */
+ (void)yx_hiddenStatusBar:(BOOL)hidden {
    [self sharedApplication].statusBarHidden = hidden;
}

/**
 打电话
 @param tel tel description
 */
+ (void)yx_callTelePhone:(NSString *)tel {
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",tel]];
    if (@available(iOS 10.0, *)) {
        [[self sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES}  completionHandler:^(BOOL success) {
        }];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[self sharedApplication] openURL:url];
#pragma clang diagnostic pop
       
    }
}
+ (void)yx_callCustomerService {
    [UIApplication yx_callTelePhone:@"400-998-2738"];
}
@end
