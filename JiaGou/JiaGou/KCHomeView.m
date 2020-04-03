//
//  KCHomeView.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCHomeView.h"
#import "KCHomeAdapter.h"


@interface KCHomeView ()
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation KCHomeView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
- (void)buildHomeView:(KCHomeAdapter *)adapter {
    
    CGRect frame = self.bounds;
    frame.origin.y = 20;
    frame.size.height -= (20+44);
    self.tableView = [[UITableView alloc] initWithFrame:frame];
    _tableView.clipsToBounds = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
    
    _tableView.delegate = adapter;
    _tableView.dataSource = adapter;
}

- (void)reloadUIWithData{
    [_tableView reloadData];
}

@end
