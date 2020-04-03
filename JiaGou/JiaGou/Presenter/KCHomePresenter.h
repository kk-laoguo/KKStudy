//
//  KCHomePresenter.h
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "CDDContext.h"

NS_ASSUME_NONNULL_BEGIN
@class KCBaseAdapter;

@protocol KCHomePresentDelegate <NSObject>

@optional
// 通过adapter建立我们的视图 : 主要是数据与视图的绑定
- (void)buildHomeView:(KCBaseAdapter *)adapter;
// 加载数据
- (void)loadDataWithAdapter:(KCBaseAdapter *)adapter;
// UI去刷新界面了
- (void)reloadUIWithData;
// 去直播间
- (void)gotoLiveStream;

@end

@interface KCHomePresenter : CDDPresenter<KCHomePresentDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
