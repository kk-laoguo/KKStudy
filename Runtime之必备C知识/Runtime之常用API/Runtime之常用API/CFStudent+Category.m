//
//  CFStudent+Category.m
//  Runtime之常用API
//
//  Created by zainguo on 2019/7/4.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CFStudent+Category.h"

@implementation CFStudent (Category)

/*
 *覆盖Student的方法
 */
- (void)playing
{
    NSLog(@"Student-Category playing！");
}
+ (void)sleeping
{
    NSLog(@"Student-Category sleeping！");
}

/*
 *新添加的方法
 */
- (void)playingBasketball
{
    NSLog(@"Student-Category playing basketball！");
}
+ (void)playingFootball
{
    NSLog(@"Student-Category playing football！");
}

@end
