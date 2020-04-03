//
//  YXTableViewDataSource.m
//  CXMerchant
//
//  Created by zainguo on 2019/3/18.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "YXTableViewDataSource.h"
#import "UITableView+YXAddition.h"
#import "YXDataSourceModel.h"

@interface YXTableViewDataSource ()

@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) TableViewCellDidSelectBlock didSelectBlock;
@property (nonatomic, copy) WillDisplayCellBlock willDisplayCellBlock;

@property (nonatomic, copy) TableViewCellHeightBlock cellHeightBlock;
@property (nonatomic, copy) TableViewNumberSectionsBlock numberSectionsBlock;
@property (nonatomic, copy) TableViewHeaderHeightBlock headerHeightBlock;
@property (nonatomic, copy) TableViewFooterHeightBlock footerHeightBlock;
@property (nonatomic, copy) TableViewHeaderViewBlock headerViewBlock;
@property (nonatomic, copy) TableViewFooterViewBlock footerViewBlock;
@property (nonatomic, copy) NSString *cellIdentigier;

@end

@implementation YXTableViewDataSource

- (void)dealloc {
#ifdef DEBUG
    NSLog(@"---------->%@释放了\n\n\n", NSStringFromClass([self class]));
#endif
}

- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)identifier
 configureCellBlock:(TableViewCellConfigureBlock)cellConfigBlock
    cellHeightBlock:(TableViewCellHeightBlock)cellHeightBlock
     didSelectBlock:(TableViewCellDidSelectBlock)didSelectBlock {
    
    if (self = [super init]) {
        _items = items.mutableCopy;
        _cellIdentigier = identifier;
        _configureCellBlock = cellConfigBlock;
        _cellHeightBlock = cellHeightBlock;
        _didSelectBlock = didSelectBlock;
    }
    return self;
    
}


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
    footerViewBlock:(TableViewFooterViewBlock)footerViewBlock {
    
    if (self = [super init]) {
        
        [tableView yx_registerCellNib:cellClass];
        _items = items;
        _numberSectionsBlock = numberSectionsBlock;
        _cellIdentigier = NSStringFromClass(cellClass);
        _configureCellBlock = cellConfigBlock;
        _willDisplayCellBlock = willDisplayCellBlock;
        _cellHeightBlock = cellHeightBlock;
        _didSelectBlock = didSelectBlock;
        _headerHeightBlock = headerHeightBlock;
        _headerViewBlock = headerViewBlock;
        _footerHeightBlock = footerHeightBlock;
        _footerViewBlock = footerViewBlock;
        [self hanleTableViewDataSourceAndDelegate:tableView];
    }
    return self;
}

- (id)initWithItems:(NSMutableArray<YXDataSourceModel *> *)items
          tableView:(UITableView *)tableView
 configureCellBlock:(TableViewCellConfigureBlock)cellConfigBlock
willDisplayCellBlock:(WillDisplayCellBlock)willDisplayCellBlock
    cellHeightBlock:(TableViewCellHeightBlock)cellHeightBlock
     didSelectBlock:(TableViewCellDidSelectBlock)didSelectBlock
  headerHeightBlock:(TableViewHeaderHeightBlock)headerHeightBlock
    headerViewBlock:(TableViewHeaderViewBlock)headerViewBlock
  footerHeightBlock:(TableViewFooterHeightBlock)footerHeightBlock
    footerViewBlock:(TableViewFooterViewBlock)footerViewBlock {
    
    
    if (self = [super init]) {
        _sections = items;
        [_sections enumerateObjectsUsingBlock:^(YXDataSourceModel * _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
            model.identifier = NSStringFromClass(model.class);
            [tableView yx_registerCellNib:model.class];
        }];
        _configureCellBlock = cellConfigBlock;
        _willDisplayCellBlock = willDisplayCellBlock;
        _cellHeightBlock = cellHeightBlock;
        _didSelectBlock = didSelectBlock;
        _headerHeightBlock = headerHeightBlock;
        _headerViewBlock = headerViewBlock;
        _footerHeightBlock = footerHeightBlock;
        _footerViewBlock = footerViewBlock;
        [self hanleTableViewDataSourceAndDelegate:tableView];
    }
    return self;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_sections.count) {
        return _sections[section].data.count;
        
    } else if (_numberSectionsBlock) {
        return [_items[section] count];
    }
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    id item;
    if (_sections.count) {
        cell = [tableView dequeueReusableCellWithIdentifier:_sections[indexPath.section].identifier forIndexPath:indexPath];
        item = _sections[indexPath.section].data[indexPath.row];
        
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentigier forIndexPath:indexPath];
        if (_items.count) {
            if (_numberSectionsBlock) {
                item = _items[indexPath.section][indexPath.row];
            } else {
                item = _items[indexPath.row];
            }
        }
    }
 
    if (_configureCellBlock) {
        _configureCellBlock(cell, item, indexPath);
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_numberSectionsBlock) {
        return _numberSectionsBlock();
    } else if (_sections.count) {
        return _sections.count;
    }
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_didSelectBlock) {
        id cell = [tableView cellForRowAtIndexPath:indexPath];
        id item;
        if (_sections.count) {
            item = _sections[indexPath.section].data[indexPath.row];
            
        } else if (_numberSectionsBlock) {
            item = _items[indexPath.section][indexPath.row];
        }
        _didSelectBlock(cell, item, indexPath);
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_willDisplayCellBlock) {
        id cell = [tableView cellForRowAtIndexPath:indexPath];
        _willDisplayCellBlock(cell, indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_cellHeightBlock) {
        return _cellHeightBlock(indexPath);
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_headerHeightBlock) {
        return _headerHeightBlock(section);
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (_footerHeightBlock) {
        return _footerHeightBlock(section);
    }
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (_footerViewBlock) {
        return _footerViewBlock(section);
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_headerViewBlock) {
        return _headerViewBlock(section);
    }
    return nil;
}

#pragma mark - Public Methods
- (void)hanleTableViewDataSourceAndDelegate:(UITableView *)tableView {
    tableView.delegate = self;
    tableView.dataSource = self;
}
- (void)refreshTableViewData:(NSMutableArray *)array {
    _items = array;
}

@end
