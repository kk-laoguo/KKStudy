//
//  CFBaseModel.h
//  字典和模型的自动转换
//
//  Created by GongCF on 2018/11/10.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFBaseModel : NSObject
- (id)initWithDataDic:(NSDictionary *)data;
- (NSString *)modelClassInPropertyArr:(NSString *)name;
@end
