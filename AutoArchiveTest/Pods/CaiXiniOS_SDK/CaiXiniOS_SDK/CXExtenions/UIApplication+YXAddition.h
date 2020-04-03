//
//  UIApplication+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIApplication (YXAddition)

/**
 高亮
 */
+ (void)yx_lightStatusBar;

/**
 黑色
 */
+ (void)yx_darkStatusBar;

/**
 状态栏隐藏状态
 @param hidden hidden description
 */
+ (void)yx_hiddenStatusBar:(BOOL)hidden;

/**
 打电话
 @param tel tel description
 */

+ (void)yx_callTelePhone:(NSString *)tel;

/**
 拨打客服电话
 */
+ (void)yx_callCustomerService;



@end

