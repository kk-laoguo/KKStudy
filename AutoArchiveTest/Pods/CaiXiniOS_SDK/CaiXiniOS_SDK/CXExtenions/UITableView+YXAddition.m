//
//  UITableView+YXAddition.m
//  CXMerchant
//
//  Created by zainguo on 2019/3/18.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UITableView+YXAddition.h"

@implementation UITableView (YXAddition)


- (void)yx_registerCellClass:(Class)cellClass {
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass([cellClass class])];
    
}

- (void)yx_registerCellNib:(Class)nib {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass([nib class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([nib class])];
}

- (void)yx_registerHeaderFooterViewClass:(Class)registerClass {
    [self registerClass:registerClass forHeaderFooterViewReuseIdentifier:NSStringFromClass([registerClass class])];
}

- (void)yx_registerHeaderFooterViewNib:(Class)registerNib {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass([registerNib class]) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass([registerNib class])];
}

- (UITableViewCell *)yx_dequeResuableCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([cellClass class]) forIndexPath:indexPath];
    return cell;
}

- (void)yx_estimatedHeight {
    self.estimatedRowHeight = 40;
    self.estimatedSectionHeaderHeight = 0;
    self.estimatedSectionFooterHeight = 0;
}


@end
