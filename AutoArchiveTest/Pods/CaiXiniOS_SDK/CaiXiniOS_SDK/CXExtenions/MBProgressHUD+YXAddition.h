//
//  MBProgressHUD+YXAddition.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/16.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>



/// 显示时长
static const NSInteger HUDTime = 2;

@interface MBProgressHUD (YXAddition)


/// 文字提示 显示时间为2妙
+ (void)yx_showMessage:(NSString *)message;

/// 文字提示显示到指定View
+ (void)yx_showMessage:(NSString *)message toView:(UIView *)view;

/// 加载文字提示 
+ (void)yx_showLodingWithMessage:(NSString *)message;
/// 加载文字提示到指定View
+ (void)yx_showLodingWithMessage:(NSString *)message toView:(UIView *)view;


/// 错误提示
+ (void)yx_showError:(NSString *)error;
/// 错误提示到指定的View
+ (void)yx_showError:(NSString *)error toView:(UIView *)view;

/// 成功提示
+ (void)yx_showSuccess:(NSString *)success;
/// 成功提示到指定的View
+ (void)yx_showSuccess:(NSString *)success toView:(UIView *)view;

/// 显示带图片和文字
+ (void)yx_showMessageWith:(NSString *)imageName
                   message:(NSString *)message
                    toView:(UIView *)view;

/// 加载提示
+ (void)yx_showLoding;

/// 指定view加载显示loding
+ (void)yx_showLodingToView:(UIView *)view;

/// 自定义ActivityIndicator 背景是透明的
+ (void)yx_showActivityIndicatorToView:(UIView *)view message:(NSString *)message;

+ (void)yx_showActivityIndicatorToView:(UIView *)view;

/// 加载动画
+ (void)yx_cxuser_lodingToView:(UIView *)view;

/// 移除
+ (void)yx_hudDismiss;


@end

