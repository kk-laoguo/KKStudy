//
//  CXStarsView.h
//  CXMerchant
//
//  Created by zainguo on 2019/4/1.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CXStarsView;
@protocol CXStarsViewDelegate <NSObject>
@optional
- (void)starsView:(CXStarsView *)starsView changedRating:(float)newRating;
@end

@interface CXStarsView : UIView



/**
 初始化设置未选中图片、半选中图片、全选中图片，以及评分值改变的代理

 @param imgWidth 图片宽度
 @param space 间隙
 @param deselectedName 未选中图片名称
 @param halfSelectedName 半选中图片名称
 @param fullSelectedName 全选中图片名称
 @param delegate 代理
 */
- (void)setImageWidth:(CGFloat)imgWidth
               space:(CGFloat)space
           deselected:(NSString *)deselectedName
         halfSelected:(NSString *)halfSelectedName
         fullSelected:(NSString *)fullSelectedName
             delegate:(id<CXStarsViewDelegate>)delegate;


/**
 *  设置评分值
 *  @param rating 评分值
 */
- (void)displayRating:(float)rating;

/**
 *  获取当前的评分值
 *  @return 评分值
 */
- (float)rating;

/**
 *  是否是指示器，如果是指示器，就不能滑动了，只显示结果，不是指示器的话就能滑动修改值
 *  默认为NO
 */
@property (nonatomic,assign) BOOL isIndicator;

@end

