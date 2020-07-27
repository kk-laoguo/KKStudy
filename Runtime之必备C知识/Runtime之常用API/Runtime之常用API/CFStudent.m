//
//  CFStudent.m
//  Runtime之常用API
//
//  Created by zainguo on 2019/7/3.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CFStudent.h"

@interface CFStudent ()
{
    NSInteger _num;     //学号
    NSNumber *_class;   //班级
}
@property(nonatomic,copy)NSString *age;     //年龄
@property(nonatomic,copy)NSArray *score;   //分数

@end

@implementation CFStudent

- (void)eatingWithFood:(NSString *)foodName inPlace:(NSString*)placeName
{
    NSLog(@"Student eatingWithFood:%@ inPlace:%@!",foodName,placeName);
}
- (void)playing
{
    NSLog(@"Student playing！");
}

+ (void)sleeping
{
    NSLog(@"Student-Category sleeping！");
}

@end
