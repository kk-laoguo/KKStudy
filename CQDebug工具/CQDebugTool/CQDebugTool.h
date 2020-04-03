//
//  CQDebugTool.h
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CQUrlContext.h"

@protocol CQDebugToolDelegate <NSObject>
@required
/** 更改环境的选项对应的数据模型*/
- (NSArray<CQUrlContext *> *)UrlContextDataForDevActionSheet;
@optional
/** 自定义功能的数量*/
- (NSInteger)numberOfCustomDebugCell;
/** 除了默认的环境切换和请求日志,可自定义其他功能的Cell,不复用,row 起始为2*/
- (UITableViewCell *)customCellForRow:(NSInteger)row;
/** 点击了自定功能Cell */
- (void)didSelectCustomCell:(UITableViewCell *)customCell row:(NSInteger)row;

@end

@interface CQDebugTool : NSObject

+ (instancetype)debugInstance;

@property (nonatomic, weak) id<CQDebugToolDelegate> delegate;

/* 当前的环境配置数据 */
@property (nonatomic, strong) CQUrlContext *currentUrlContext;

/** window */
- (UIWindow *)debugWindow;
- (UINavigationController *)debugNav;

/** 设置请求日志文档内容 */
- (void)appendRequestLog:(NSString *)log;
- (void)clearRequestLog;
- (NSString *)requestLog;

//是否显示页面销毁消息
@property (nonatomic, assign) BOOL deallocMessageShow;
/* 忽略页面的类名集合 */
- (NSSet *)ignoreClasss;
/*添加删除忽略页面的类名*/
- (void)addIgnoreClassNames:(NSArray <NSString *>*)classNames;
- (void)removeIgnoreClassName:(NSString *)className;

@end
