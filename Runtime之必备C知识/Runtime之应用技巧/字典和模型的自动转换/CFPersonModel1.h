//
//  CFPersonModel.h
//  2字典和模型的自动转换
//
//  Created by GongCF on 2018/9/16.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFBaseModel.h"
@interface CFPersonModel1 : CFBaseModel
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *age;
@property(nonatomic,copy)NSString *height;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *personId;
@end
