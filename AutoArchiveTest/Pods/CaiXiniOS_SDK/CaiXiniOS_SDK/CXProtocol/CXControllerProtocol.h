//
//  CXControllerProtocol.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/19.
//  Copyright © 2019年 zainguo. All rights reserved.
//



@protocol CXControllerProtocol <NSObject>

@optional
/**
  绑定ViewModel
 */
- (void)yx_bindViewModel;
/**
 初始化属性
 */
- (void)yx_configure;
/**
 添加子控件
 */
- (void)yx_addSubViews;
/**
 加载数据
 */
- (void)yx_loadNewData;
/**
 配置导航
 */
- (void)yx_configureNavigation;
/**
 加载数据源(需要实现)
 */
- (void)yx_loadData;


@end
