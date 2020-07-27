//
//  main.m
//  自动归档和自动解档
//
//  Created by zainguo on 2019/7/14.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CFPerson *person1 = [[CFPerson alloc]init];
        person1.name = @"lilei";
        person1.icon = @"lilei.png";
        person1.age = @"20";
        person1.height = @"180";
        person1.money = @"128888.8";
        person1.personId = @"123456";
        NSLog(@"===========归档前===========");
    NSLog(@"name=%@,icon=%@,age=%@,height=%@,money=%@,personId=%@",person1.name,person1.icon,person1.age,person1.height,person1.money,person1.personId);
        //1.归档
        NSString *file = [[NSBundle bundleWithPath:@"/Users/zainguo/Desktop/Runtime之必备C知识/Runtime之应用技巧/自动归档和自动解档"] pathForResource:@"lilei" ofType:@"plist"];
        [NSKeyedArchiver archiveRootObject:person1 toFile:file];
        //2.解档
        CFPerson *person2 = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
        NSLog(@"===========解档后===========");
    NSLog(@"name=%@,icon=%@,age=%@,height=%@,money=%@,personId=%@",person2.name,person2.icon,person2.age,person2.height,person2.money,person2.personId);


    }
    return 0;
}
