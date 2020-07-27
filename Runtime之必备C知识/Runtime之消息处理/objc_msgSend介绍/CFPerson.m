//
//  CFPerson.m
//  类方法和实例方法之间的区别
//
//  Created by zainguo on 2019/6/27.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CFPerson.h"

@implementation CFPerson
//吃东西
- (void)eatingWithFood:(NSString*)foodName inPlace:(NSString*)placeName;
{
    NSLog(@"Person eatingWithFood:%@ inPlace:%@！",foodName,placeName);
}

//玩耍
- (void)playing
{
    NSLog(@"Person playing！");
}

//睡觉
+ (void)sleeping
{
    NSLog(@"Person sleeping！");
}

@end
