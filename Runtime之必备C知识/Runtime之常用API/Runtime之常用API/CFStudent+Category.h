//
//  CFStudent+Category.h
//  Runtime之常用API
//
//  Created by zainguo on 2019/7/4.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CFStudent.h"

/*
 *1.有协议
 *2.有类属性
 *3.有实例属性
 *4.覆盖主类的实例属性
 *5.覆盖主类的实例方法
 *6.覆盖主类的类方法
 *7.添加实例方法
 *8.添加类方法
 */


NS_ASSUME_NONNULL_BEGIN

@protocol ExaminationRul
@optional
- (void)level6test;
@end
@interface CFStudent (Category)<ExaminationRul>


@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *teacher;
@property(class,nonatomic,copy)NSString *partner;
/*
 *覆盖Student的方法
 */
- (void)playing;
+ (void)sleeping;

/*
 *新添加的方法
 */
- (void)playingBasketball;
+ (void)playingFootball;
@end

NS_ASSUME_NONNULL_END
