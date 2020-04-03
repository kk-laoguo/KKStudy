//
//  NSMutableAttributedString+YXAddition.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "NSMutableAttributedString+YXAddition.h"

#define YXStrEmpty(str) ([str isKindOfClass:[NSNull class]] || [str length] < 1 ? YES : NO || [str isEqualToString:@"(null)"] || str == nil || str == NULL)

@implementation NSMutableAttributedString (YXAddition)


/// 初始化AttributedString
+ (NSMutableAttributedString *(^)(NSString *))yx_initAttributeString {
    return ^(NSString *string) {
        NSCAssert(!YXStrEmpty(string), @"attributeString must be exist \n\n%@\n%d\n\n%s\n\n",self,__LINE__,__func__);
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        return attributedString;
    };
}

/// AttributedString字体大小
- (NSMutableAttributedString *(^)(CGFloat))attributedFontSize {
    return ^(CGFloat fontSize) {
        [self addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, self.string.length )];
        return self;
    };
}

/// AttributedString字体颜色
- (NSMutableAttributedString *(^)(UIColor *))attributedColor {
    return ^(UIColor *color) {
        [self addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, self.string.length)];
        return self;
    };
}

/// AttributedString字体行间距
- (NSMutableAttributedString *(^)(CGFloat))attributedLineSpace {
    return ^(CGFloat space) {
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        paraStyle.lineSpacing = space;
        // 设置uitextView的行间距的时候设置 node == NSLineBreakByTruncatingTail 不能换行
        paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, self.string.length - 1)];
        return self;
    };
}

/// 设置指定位置字体颜色
- (NSMutableAttributedString *(^)(UIColor * , NSRange))attributedRangeColor {
    return ^(UIColor *color, NSRange range) {
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
        return self;
    };
}

/// 设置指定位置字体大小
- (NSMutableAttributedString *(^)(CGFloat, NSRange))attributedRangeFontSize {
    return ^(CGFloat fontSize, NSRange range) {
        [self addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
        return self;
    };
}


/// 设置指定位置字体大小, 加粗
- (NSMutableAttributedString *(^)(CGFloat, NSRange))attributeRangeBoldFontSize {
    return ^(CGFloat fontSize, NSRange range) {
        [self addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontSize] range:range];
        return self;
    };
}


@end
