//
//  CXViewProtocol.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/19.
//  Copyright © 2019年 zainguo. All rights reserved.
//


@protocol CXViewModelProtocol;

@protocol CXViewProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(id<CXViewModelProtocol>)viewModel;


- (void)yx_bindViewModel:(id<CXViewModelProtocol>)viewModel;
/**
 绑定Viewmodel
 */
- (void)yx_bindViewModel;
/**
 设置View
 */
- (void)yx_addSubviews;


@end
