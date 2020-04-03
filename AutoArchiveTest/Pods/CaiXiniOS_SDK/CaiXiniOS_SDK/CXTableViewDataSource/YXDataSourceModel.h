//
//  YXDataSourceModel.h
//  CXMerchant
//
//  Created by zainguo on 2019/4/13.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CellDidSelectBlock)(id cell, id item, NSIndexPath *indexPath);
typedef void(^CellConfigureBlock)(id cell, id item, NSIndexPath *indexPath);

@interface YXDataSourceModel : NSObject

@property(nonatomic, copy) CellDidSelectBlock cellDidSelect;
@property(nonatomic, copy) CellConfigureBlock cellConfig;

@property(nonatomic, strong) NSArray *data;
@property(nonatomic, strong) Class cell;
@property(nonatomic, strong) NSString *identifier;
@property(nonatomic, strong) NSString *headerTitle;
@property(nonatomic, strong) NSString *footerTitle;
@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, strong) UIView *footerView;

@property(nonatomic, assign) BOOL isAutoHeight;

/**
 是否是注册XIB单元格 默认: YES
 */
@property(nonatomic, assign) BOOL isRegisterNib;
@property(nonatomic, assign) CGFloat cellHeight;
@end

