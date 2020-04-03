//
//  UITableView+YXAddition.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/18.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITableView (YXAddition)

/// 注册cell
- (void)yx_registerCellClass:(Class)cellClass;
- (void)yx_registerCellNib:(Class)nib;

/// 注册header & footer
- (void)yx_registerHeaderFooterViewClass:(Class)registerClass;
- (void)yx_registerHeaderFooterViewNib:(Class)registerNib;

/// 重用Cell
- (UITableViewCell *)yx_dequeResuableCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath;
/// 设置预估高度
- (void)yx_estimatedHeight;

@end

