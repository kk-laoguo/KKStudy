//
//  YXTableViewDataSource.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/18.
//  Copyright © 2019年 zainguo. All rights reserved.
//


#import <UIKit/UIKit.h>

@class YXDataSourceModel;

typedef void(^TableViewCellConfigureBlock)(id cell, id item, NSIndexPath *indexPath);
typedef void(^TableViewCellDidSelectBlock)(id cell, id item, NSIndexPath *indexPath);
typedef void(^WillDisplayCellBlock)(id cell, NSIndexPath *indexPath);

typedef NSInteger(^TableViewNumberSectionsBlock)(void);

typedef CGFloat(^TableViewCellHeightBlock)(NSIndexPath *indexPath);
typedef CGFloat(^TableViewHeaderHeightBlock)(NSInteger section);
typedef CGFloat(^TableViewFooterHeightBlock)(NSInteger section);
typedef UIView *(^TableViewHeaderViewBlock)(NSInteger section);
typedef UIView *(^TableViewFooterViewBlock)(NSInteger section);

@interface YXTableViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) NSMutableArray <YXDataSourceModel *> *sections;


/**
 * 没有header / footer
 * 使用需要先注册cell
 * 需要设置tableView代理 (hanleTableViewDataSourceAndDelegate:(UITableView *)tableView)
 */
- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)identifier
 configureCellBlock:(TableViewCellConfigureBlock)cellConfigBlock
    cellHeightBlock:(TableViewCellHeightBlock)cellHeightBlock
     didSelectBlock:(TableViewCellDidSelectBlock)didSelectBlock;


/**
 * 包含header / footer
 * 无需注册cell、设置tableView代理
 * Class 类型必须是xib创建
 * 当是多区的时候, 数组源格式需是: @[@[@1,@2], @[@1]] 数组里面包含数组样式
 */
- (id)initWithItems:(NSMutableArray*)items
          tableView:(UITableView *)tableView
          cellClass:(Class)cellClass
numberSectionsBlock:(TableViewNumberSectionsBlock)numberSectionsBlock
 configureCellBlock:(TableViewCellConfigureBlock)cellConfigBlock
willDisplayCellBlock:(WillDisplayCellBlock)willDisplayCellBlock
    cellHeightBlock:(TableViewCellHeightBlock)cellHeightBlock
     didSelectBlock:(TableViewCellDidSelectBlock)didSelectBlock
  headerHeightBlock:(TableViewHeaderHeightBlock)headerHeightBlock
    headerViewBlock:(TableViewHeaderViewBlock)headerViewBlock
  footerHeightBlock:(TableViewFooterHeightBlock)footerHeightBlock
    footerViewBlock:(TableViewFooterViewBlock)footerViewBlock;

/**
 * 包含header / footer
 * 可以同时注册多种样式Cell
 * 无需注册cell、设置tableView代理
 * Class 类型必须是xib创建
 * 当是多区的时候, 数组源格式需是: @[@[@1,@2], @[@1]] 数组里面包含数组样式
 */
- (id)initWithItems:(NSMutableArray<YXDataSourceModel *> *)items
          tableView:(UITableView *)tableView
 configureCellBlock:(TableViewCellConfigureBlock)cellConfigBlock
willDisplayCellBlock:(WillDisplayCellBlock)willDisplayCellBlock
    cellHeightBlock:(TableViewCellHeightBlock)cellHeightBlock
     didSelectBlock:(TableViewCellDidSelectBlock)didSelectBlock
  headerHeightBlock:(TableViewHeaderHeightBlock)headerHeightBlock
    headerViewBlock:(TableViewHeaderViewBlock)headerViewBlock
  footerHeightBlock:(TableViewFooterHeightBlock)footerHeightBlock
    footerViewBlock:(TableViewFooterViewBlock)footerViewBlock;

/**
 设置tableView代理
 @param tableView tableView
 */
- (void)hanleTableViewDataSourceAndDelegate:(UITableView *)tableView;


/**
 刷新tableView
 @param array 数据源
 */
- (void)refreshTableViewData:(NSMutableArray *)array;



@end

