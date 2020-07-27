//
//  CFStudent.h
//  类方法和实例方法之间的区别
//
//  Created by zainguo on 2019/6/27.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CFPerson.h"
@protocol StudentRule
@optional
- (void)borrowBook;
@end

@interface CFStudent : CFPerson <StudentRule>

//学校
@property (nonatomic, strong) NSString *school;
//学习
- (void)studying;
//学习某本书
- (void)studyingWithBook:(NSString *)bookName;
//在某个地方学习某本书
- (void)studyingWithBook:(NSString *)bookName inPlace:(NSString *)placeName;

@end

