//
//  UILabel+YXAddition.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UILabel+YXAddition.h"
#import <CoreText/CoreText.h>


#define YXStrEmpty(str) ([str isKindOfClass:[NSNull class]] || [str length] < 1 ? YES : NO || [str isEqualToString:@"(null)"] || str == nil || str == NULL)

@implementation UILabel (YXAddition)


/// 快速创建UILabel
+ (instancetype)yx_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                           color:(UIColor *)color {
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
}
/// 有删除线的
- (void)yx_delLineStr:(NSString *)string {
    
    if (YXStrEmpty(string)) {
        return;
    }
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:string];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, string.length)];
    [self setAttributedText:attri];
}
/// 有下划线的
- (void)yx_underlineStr:(NSString *)string {
    if (YXStrEmpty(string)) {
        return;
    }
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:string];
    [attri addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, string.length)];
    [self setAttributedText:attri];
    
}

/// 设置label的行间距默认为：10
- (void)yx_labelLineSpace:(NSString*)string {
    [self yx_labeLineSpace:10 string:string];
    
}
/// 设置label的行间距
- (void)yx_labeLineSpace:(CGFloat)space string:(NSString*)string {
    if (YXStrEmpty(string)) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 设置行间距正确姿势😀😀
    // paragraphStyle.lineSpacing = space - (self.font.lineHeight - self.font.pointSize);
    paragraphStyle.lineSpacing = space;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    self.attributedText = attributedString;
    // [self sizeToFit];
}

/// 设置Html代码格式Str
- (void)yx_htmlString:(NSString *)htmlStr {
    if (YXStrEmpty(htmlStr)) {
        return;
    }
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.attributedText = attributedString;
}
/// 设置Html代码格式Str与行高
- (void)yx_htmlString:(NSString *)htmlStr labelRowOfHeight:(CGFloat)height {
    if (YXStrEmpty(htmlStr)) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:height]; //调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}

/// 获取lab上每行显示的文字
- (NSArray *)yx_everyLineText {
    
    NSCAssert(!YXStrEmpty(self.text), @" lab.text must be exist \n\n%@\n%d\n\n%s\n\n",self,__LINE__,__func__);
    NSString * text = self.text;
    UIFont * font = self.font;
    CGRect rect = self.frame;
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    
    CFRelease(myFont);
    CFRelease(frameSetter);
    CFRelease(path);
    CFRelease(frame);
    
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    
    for (id line in lines) {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return (NSArray *)linesArray;
}

// 设置指定stirng 颜色
- (void)yx_attributeColor:(UIColor *)color string:(NSString *)string {
    if (!self.text || YXStrEmpty(string)) {
        return;
    }
    NSMutableAttributedString * attribute = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSRange range = [self.text rangeOfString:string];
    [attribute addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attribute;
}


@end
