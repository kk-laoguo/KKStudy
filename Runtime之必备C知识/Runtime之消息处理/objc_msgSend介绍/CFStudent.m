//
//  CFStudent.m
//  类方法和实例方法之间的区别
//
//  Created by zainguo on 2019/6/27.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CFStudent.h"

@implementation CFStudent

//学习
- (void)studying
{
    NSLog(@"Student studying！");
}
//学习某本书
- (void)studyingWithBook:(NSString *)bookName
{
    NSLog(@"Student studyingWithBook：%@!",bookName);
}
//在某个地方学习某本书
- (void)studyingWithBook:(NSString *)bookName inPlace:(NSString *)placeName
{
    NSLog(@"Student studyingWithBook：%@! inPlace：%@",bookName,placeName);
}
- (void)borrowBook
{
    NSLog(@"borrowBook!");
}

@end
