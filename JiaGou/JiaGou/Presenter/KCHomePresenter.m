//
//  KCHomePresenter.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCHomePresenter.h"
#import "KCHomeAdapter.h"
#import "KCHomeModel.h"


@implementation KCHomePresenter

- (void)loadDataWithAdapter:(KCBaseAdapter *)adapter {
    
    for (int i = 0; i < 20; i ++) {
        KCHomeModel *model = [KCHomeModel new];
        model.name = [NSString stringWithFormat:@"我是%d号选手", i];
        [self.dataArray addObject:model];
    }
    
    [adapter setAdapterArray:self.dataArray];
    // 刷新tableView
    KC(self.view, KCHomePresentDelegate, reloadUIWithData);
    
}
#pragma mark - lazy

- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}


@end
