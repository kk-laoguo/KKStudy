//
//  CXViewModelProtocol.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/19.
//  Copyright © 2019年 zainguo. All rights reserved.
//



@protocol CXViewModelProtocol <NSObject>

@optional
/**
 初始化方法
 */
- (instancetype)initWithParams:(id)params;
/**
  viewModel 初始化属性
 */
- (void)yx_initialize;



@end
