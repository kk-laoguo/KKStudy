//
//  YXNavigationBar.m
//  CXMerchant
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//


#import "YXNavigationBar.h"
#import "UIView+YXAddition.h"
#import "CaiXinDeviceInline.h"


#define kSCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define kNAVIBAR_HEIGHT         (isIPhoneX() ? 88 : 64)
#define kSTATUSBAR_HEIGHT       (isIPhoneX() ? 44 : 20)


static const CGFloat BarItemHeight = 40;
static const CGFloat BarItemWidth = 45;

static YXNavigationBar *shareInstance;

@interface YXNavigationBar()

@property (nonatomic, strong) UIView *statusView;
@property (nonatomic, strong) UIViewController *controller;

@end

@implementation YXNavigationBar

#pragma mark - Intial Methods
- (instancetype)init {
    
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, kSCREEN_WIDTH, kNAVIBAR_HEIGHT);
        self.backgroundColor = [UIColor whiteColor];
        [self.navigationBarView addSubview:self.barLine];
        [self.navigationBarView bringSubviewToFront:self.barLine];
    }
    return self;
}

#pragma mark - Public Methods
- (void)yx_removeBackAction {
    [self.leftItem removeTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Setter Methods
- (void)setTitle:(NSString *)title {
    _title = title;
    [self.titleButton setTitle:title forState:UIControlStateNormal];
    [self.titleButton sizeToFit];
    self.titleButton.centerY = self.titleView.centerY;
    self.titleButton.width = self.titleView.width;
    self.titleButton.x = 0;
}


#pragma mark - Target Methods
- (void)backAction {
    [self.yx_currentViewController.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Lazy Loads
- (UIView *)statusView {
    if (!_statusView) {
        _statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSTATUSBAR_HEIGHT)];
        _statusView.backgroundColor = [UIColor clearColor];
        [self addSubview:_statusView];
    }
    return _statusView;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_backgroundImageView];
        [self sendSubviewToBack:_backgroundImageView];
    }
    return _backgroundImageView;
}

- (UIView *)navigationBarView {
    if (!_navigationBarView) {
        _navigationBarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.statusView.bottom, kSCREEN_WIDTH, kNAVIBAR_HEIGHT - self.statusView.height)];
        _navigationBarView.backgroundColor = [UIColor clearColor];
        _navigationBarView.clipsToBounds = YES;
        [self addSubview:_navigationBarView];
    }
    return _navigationBarView;
}
- (UIButton *)leftItem {
    if (!_leftItem) {
        _leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftItem.adjustsImageWhenHighlighted = NO;
        _leftItem.frame = CGRectMake(0, (self.navigationBarView.height - BarItemHeight)/2.0, BarItemWidth, BarItemHeight);
        _leftItem.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [_leftItem addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        if (self.controller.navigationController.childViewControllers.count > 1) {
            [_leftItem setImage:[UIImage imageNamed:@"icon_left_arrow"] forState:UIControlStateNormal];
        }
        
        [self.navigationBarView addSubview:_leftItem];
    }
    return _leftItem;
}
- (UIButton *)rightItem {
    // 不要在这里更改rightButton 的宽度和x坐标
    if (!_rightItem) {
        _rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightItem.adjustsImageWhenHighlighted = NO;
        _rightItem.frame = CGRectMake(kSCREEN_WIDTH - BarItemWidth, (self.navigationBarView.height - BarItemHeight)/2.0, BarItemWidth, BarItemHeight);
        [_rightItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rightItem.titleLabel.font = [UIFont systemFontOfSize:14];
        _rightItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.navigationBarView addSubview:_rightItem];
    }
    return _rightItem;
}

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(self.leftItem.right + 5, 0, kSCREEN_WIDTH - (self.leftItem.right + 5) * 2, self.navigationBarView.height)];
        [self.navigationBarView addSubview:_titleView];
    }
    return _titleView;
}
- (UIButton *)titleButton {
    if (!_titleButton) {
        _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:18];
        _titleButton.titleLabel.numberOfLines = 1;
        _titleButton.centerY = self.titleView.centerY;
        _titleButton.backgroundColor = [UIColor clearColor];
        _titleButton.adjustsImageWhenHighlighted = NO;
        _titleButton.userInteractionEnabled = false;
        [self.titleView addSubview:_titleButton];
        
    }
    return _titleButton;
}

- (UIView *)barLine {
    
    if (!_barLine) {
        _barLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationBarView.height - 0.5, kSCREEN_WIDTH, 0.5)];
        _barLine.backgroundColor = [UIColor clearColor];
        [self.navigationBarView addSubview:_barLine];
    }
    return _barLine;
}
- (UIViewController *)controller {
    return self.yx_currentViewController;
}
@end
