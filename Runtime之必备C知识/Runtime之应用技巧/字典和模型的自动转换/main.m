//
//  main.m
//  字典和模型的自动转换
//
//  Created by zainguo on 2019/7/14.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPersonModel1.h"
#import "CFPersonModel2.h"
#import "CFPersonModel3.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        /*
         *1.正常字典（包含NSNUmber、NSNull）
         */
        NSDictionary *dict1 = @{@"name":@"lilei",
                                @"icon":@"lilei.png",
                                @"age":@20,
                                @"height":@"180",
                                @"money":[NSNull null],
                                @"id":@"123456"};
        
        CFPersonModel1 *model1 = [[CFPersonModel1 alloc] initWithDataDic:dict1];
        NSLog(@"=================1====================");
    NSLog(@"name=%@,icon=%@,age=%@,height=%@,money=%@,personId=%@",model1.name,model1.icon,model1.age,model1.height,model1.money,model1.personId);
    
        /*
         *2.字典中嵌套字典
         */
        NSDictionary *dict2 = @{
                                @"name":@"lilei",
                                @"student":@{
                                        @"icon":@"lilei.png",
                                        @"age":@20
                                        }
                                };
        CFPersonModel2  *model2 = [[CFPersonModel2 alloc]initWithDataDic:dict2];
        NSLog(@"=================2====================");
        NSLog(@"name=%@,student.icon=%@,student.age=%@",model2.name,model2.student.icon,model2.student.age);
        
        /*
         *3.字典中有数组，数组里是很多字典
         */
        NSDictionary *dict3 = @{
                                @"name":@"lilei",
                                @"students":@[
                                        @{
                                            @"icon":@"lilei.png",
                                            @"age":@20
                                            },
                                        @{
                                            @"icon":@"zhangsan.png",
                                            @"age":@23
                                            }
                                        ]
                                };
        
        CFPersonModel3 *model3 = [[CFPersonModel3 alloc]initWithDataDic:dict3];
        NSLog(@"=================3====================");
        NSLog(@"name=%@",model3.name);
        for (CFStudentModel *student in model3.students) {
            NSLog(@"icon=%@,age=%@",student.icon,student.age);
        }
        
        
    }
    return 0;
}
