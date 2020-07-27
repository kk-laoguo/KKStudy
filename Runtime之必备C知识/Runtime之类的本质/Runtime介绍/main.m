//
//  main.m
//  Runtime介绍
//
//  Created by zainguo on 2019/6/24.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>


@interface Person : NSObject
@property (nonatomic, assign) int age;


@end
@implementation Person



@end

char findFirstChar(char* cha)
{
    char result = '\0';
    
    // 定义一个数组 用来存储各个字母出现次数
    int array[256];
    
    // 对数组进行初始化操作
    for (int i=0; i<256; i++) {
        array[i] =0;
    }
    // 定义一个指针 指向当前字符串头部
    char* p = cha;
    // 遍历每个字符
    while (*p != '\0') {
        // 在字母对应存储位置 进行出现次数+1操作
        array[*(p++)]++;
    }
    
    // 将P指针重新指向字符串头部
    p = cha;
    // 遍历每个字母的出现次数
    while (*p != '\0') {
        // 遇到第一个出现次数为1的字符，打印结果
        if (array[*p] == 1)
        {
            result = *p;
            break; 
        }
        // 反之继续向后遍历
        p++;
    }
    
    return result;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [Person new];
//        p.age = 20;
//        NSLog(@"年龄是：%d",p.age);
        
//        Person *p = ((Person *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Person"), sel_registerName("new"));
//        ((void (*)(id, SEL, int))(void *)objc_msgSend)((id)p, sel_registerName("setAge:"), 20);
        
        ((void (*)(id, SEL, int))(void *)objc_msgSend)((id)p, @selector(setAge:), 20);
        char a = findFirstChar("A");
        NSLog(@"年龄是：%d",p.age);
        
        
    }
    return 0;
}
