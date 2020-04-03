//
//  UIView+Badge.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Badge)
/**
 *  通过创建label，显示小红点；
 */
@property (nonatomic, strong) UILabel *badge;

/**
 显示几个小红点
 @param redCount num
 */
- (void)yx_showBadgeWithCount:(NSInteger)redCount;
/**
 *  显示小红点
 */
- (void)yx_showBadge;

/**
 *  隐藏小红点
 */
- (void)yx_hidenBadge;

@end

