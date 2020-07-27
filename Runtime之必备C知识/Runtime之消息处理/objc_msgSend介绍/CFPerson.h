//
//  CFPerson.h
//  类方法和实例方法之间的区别
//
//  Created by zainguo on 2019/6/27.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CFPerson : NSObject
//姓名
@property(nonatomic,copy)NSString *name;
//吃东西
- (void)eatingWithFood:(NSString*)foodName inPlace:(NSString*)placeName;
//玩耍
- (void)playing;
//睡觉
+ (void)sleeping;
@end

