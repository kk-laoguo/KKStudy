//
//  UITextField+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITextField (YXAddition)
/**
 限制输入框文字个数
 */
@property (nonatomic, assign) NSInteger limitCount;
/**
 站位颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;
/**
 禁止输入空格
 */
@property (nonatomic, assign) BOOL forbiddenSpace;
/**
 禁止输入特殊字符
 */
@property (nonatomic, assign) BOOL forbiddenSpecialCharacters;
/**
 只能输入数字
 */
@property (nonatomic, assign) BOOL onlyInputNumber;


@end

