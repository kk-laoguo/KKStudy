//
//  YXNavigationBar.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXNavigationBar : UIView

/** 导航view */
@property (nonatomic, strong) UIView *navigationBarView;
/** 背景图片 */
@property (nonatomic, strong) UIImageView *backgroundImageView;
/** 中间的button */
@property (nonatomic, strong) UIButton *titleButton;
/** 中间的view */
@property (nonatomic, strong) UIView *titleView;
/** 左边的返回按钮 */
@property (nonatomic, strong) UIButton *leftItem;
/** 右按钮 */
@property (nonatomic, strong) UIButton *rightItem;
/** 导航条颜色 */
@property (nonatomic, strong) UIColor *navigationBarColor;
/** 导航底线 */
@property (nonatomic, strong) UIView *barLine;
/** 中间的标题 */
@property (nonatomic, copy) NSString *title;


- (void)yx_removeBackAction;



@end

NS_ASSUME_NONNULL_END
