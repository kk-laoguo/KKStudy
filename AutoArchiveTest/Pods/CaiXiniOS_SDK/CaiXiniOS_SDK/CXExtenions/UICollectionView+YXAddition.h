//
//  UICollectionView+YXAddition.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/20.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (YXAddition)

/// 注册cell
- (void)yx_registerCellClass:(Class)cellClass;
- (void)yx_registerCellNib:(Class)nib;
/// 注册header & footer
- (void)yx_registerHeaderFooterViewClass:(Class)registerClass isHeader:(BOOL)isHeader;
- (void)yx_registerHeaderFooterViewNib:(Class)registerNib isHeader:(BOOL)isHeader;
/// 重用Cell
- (UICollectionViewCell *)yx_dequeResuableCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath;

- (UICollectionReusableView *)yx_dequeReusableHeaderFooterClass:(Class)headerFooterClass
                                                      indexPath:(NSIndexPath *)indexPath
                                                       isHeader:(BOOL)isHeader;

@end

NS_ASSUME_NONNULL_END
