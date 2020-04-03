//
//  UICollectionView+YXAddition.m
//  CXMerchant
//
//  Created by zainguo on 2019/3/20.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UICollectionView+YXAddition.h"

@implementation UICollectionView (YXAddition)

/// 注册cell
- (void)yx_registerCellClass:(Class)cellClass {
    [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass([cellClass class])];
}

- (void)yx_registerCellNib:(Class)nib {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass([nib class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([nib class])];
}

/// 注册header & footer
- (void)yx_registerHeaderFooterViewClass:(Class)registerClass isHeader:(BOOL)isHeader {
    [self registerClass:registerClass forSupplementaryViewOfKind:isHeader ? UICollectionElementKindSectionHeader:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([registerClass class])];
}
- (void)yx_registerHeaderFooterViewNib:(Class)registerNib isHeader:(BOOL)isHeader {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass([registerNib class]) bundle:nil] forSupplementaryViewOfKind:isHeader ? UICollectionElementKindSectionHeader:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([registerNib class])];
}

/// 重用Cell
- (UICollectionViewCell *)yx_dequeResuableCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass([cellClass class]) forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)yx_dequeReusableHeaderFooterClass:(Class)headerFooterClass
                                                      indexPath:(NSIndexPath *)indexPath
                                                       isHeader:(BOOL)isHeader {
    UICollectionReusableView *reusableView = [self dequeueReusableSupplementaryViewOfKind:isHeader ? UICollectionElementKindSectionHeader:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([headerFooterClass class]) forIndexPath:indexPath];
    
    return reusableView;
}


@end
