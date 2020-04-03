//
//  UIView+Badge.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UIView+Badge.h"
#import <objc/runtime.h>

static char kBadgeViewKey;
//小红点的宽高
static NSInteger const kBadgeWidth = 6;
//距离控件右边的距离
static NSInteger const kRightMargin = -4;
//字体的大小
static CGFloat const kBadgeFont = 9;


@implementation UIView (Badge)

- (UILabel *)badge {
    return objc_getAssociatedObject(self, &kBadgeViewKey);
}
- (void)setBadge:(UILabel *)badge {
    objc_setAssociatedObject(self, &kBadgeViewKey, badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)yx_showBadge {
    if (!self.badge) {
        CGRect frame = CGRectMake(CGRectGetWidth(self.frame) + kRightMargin, -kBadgeWidth/2.0, kBadgeWidth, kBadgeWidth);
        self.badge = [[UILabel alloc] initWithFrame:frame];
        self.badge.backgroundColor = [UIColor redColor];
        //圆角为宽度的一半
        self.badge.layer.cornerRadius = kBadgeWidth/2.0;
        self.badge.layer.masksToBounds = YES;
        [self addSubview:self.badge];
        [self bringSubviewToFront:self.badge];
    }
}
- (void)yx_hidenBadge {
    [self.badge removeFromSuperview];
    self.badge = nil;
}
- (void)yx_showBadgeWithCount:(NSInteger)redCount {
    if (redCount <= 0) {
        [self yx_hidenBadge];
        return;
    }
    [self yx_showBadge];
    self.badge.textColor = [UIColor whiteColor];
    self.badge.font = [UIFont systemFontOfSize:kBadgeFont];
    self.badge.textAlignment = NSTextAlignmentCenter;
    self.badge.text = (redCount > 99 ? [NSString stringWithFormat:@"99+"] : [NSString stringWithFormat:@"%@", @(redCount)]);
    [self.badge sizeToFit];
    CGRect frame = self.badge.frame;
    frame.size.width += 4;
    frame.size.height += 4;
    frame.origin.y = -frame.size.height /  2.0;
    if (CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
        frame.size.width = CGRectGetHeight(frame);
    }
    self.badge.frame = frame;
    self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 2;
    self.badge.layer.masksToBounds = YES;
}

@end
