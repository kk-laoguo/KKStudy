//
//  UITextField+YXAddition.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UITextField+YXAddition.h"
#import <objc/runtime.h>

static const void *PlaceHolderColorKey = &PlaceHolderColorKey;
static const void *LimitCountKey = &LimitCountKey;

@implementation UITextField (YXAddition)


#pragma mark - Getter Methods
- (NSInteger)limitCount {
    return [objc_getAssociatedObject(self, LimitCountKey) integerValue];
}
- (UIColor *)placeholderColor {
    return objc_getAssociatedObject(self, PlaceHolderColorKey);
}
- (BOOL)forbiddenSpace {
    return [objc_getAssociatedObject(self, @selector(forbiddenSpace)) boolValue];
}
- (BOOL)forbiddenSpecialCharacters {
    return [objc_getAssociatedObject(self, @selector(forbiddenSpecialCharacters)) boolValue];
}
- (BOOL)onlyInputNumber {
    return [objc_getAssociatedObject(self, @selector(onlyInputNumber)) boolValue];
}
#pragma mark - Setter Methods
- (void)setLimitCount:(NSInteger)limitCount {
    objc_setAssociatedObject(self, LimitCountKey, [NSString stringWithFormat:@"%ld",(long)limitCount], OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    objc_setAssociatedObject(self, PlaceHolderColorKey, placeholderColor,  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    // iOS13不能用了
//    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setForbiddenSpace:(BOOL)forbiddenSpace {
    objc_setAssociatedObject(self, @selector(forbiddenSpace), [NSString stringWithFormat:@"%ld", (long)forbiddenSpace], OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setForbiddenSpecialCharacters:(BOOL)forbiddenSpecialCharacters {
    objc_setAssociatedObject(self, @selector(forbiddenSpecialCharacters), [NSString stringWithFormat:@"%ld", (long)forbiddenSpecialCharacters], OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventEditingChanged];
    
}
- (void)setOnlyInputNumber:(BOOL)onlyInputNumber {
    objc_setAssociatedObject(self, @selector(onlyInputNumber), [NSString stringWithFormat:@"%ld", (long)onlyInputNumber], OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventEditingChanged];

}

#pragma mark - Target Methods
- (void)changeText:(UITextField *)textField {
    
    if (self.forbiddenSpace) {
        NSString *str = [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        self.text = str;
    }
    if (self.forbiddenSpecialCharacters) {
        NSString *space = [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        self.text = space;
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString: @"@／：；（）¥「」＂、[]{}#%-*+=_//|~＜＞$€^£•'@#$%^&*():;.,?!<>\\_+'/\""];
        NSString *trimmedString = [self.text stringByTrimmingCharactersInSet:set];
        self.text = trimmedString;
    }

    if (self.onlyInputNumber) {
        /// 只能输入数字
        self.text = [self.text stringByTrimmingCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
    }
    
    if (self.limitCount) {
        
        NSString *toBeString = textField.text;
        // 键盘输入模式
        NSString *lang = [textField textInputMode].primaryLanguage;
        if ([lang isEqualToString:@"zh-Hans"]) {
            // 简体中文输入，包括简体拼音，健体五笔，简体手写
            UITextRange *selectedRange = [textField markedTextRange];
            //获取高亮部分
            UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            int chNum =0;
            for (int i=0; i<toBeString.length; ++i) {
                NSRange range = NSMakeRange(i, 1);
                NSString *subString = [toBeString substringWithRange:range];
                const char *cString = [subString UTF8String];
                if (cString == nil) {
                    chNum ++;
                } else if (strlen(cString) == 3) {
                    chNum ++;
                }
            }
            if (!position) {
                if (toBeString.length > self.limitCount) {
                    textField.text = [toBeString substringToIndex:self.limitCount];
                }
            } else {
                
            }
        } else {
            if (toBeString.length > self.limitCount) {
                textField.text = [toBeString substringToIndex:self.limitCount];
            }
        }
        
    }
   
}


@end
