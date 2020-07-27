//
//  CFPerson.h
//  3自动归档和自动解档
//
//  Created by GongCF on 2018/9/16.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFPerson : NSObject <NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *age;
@property(nonatomic,copy)NSString *height;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *personId;
@end
