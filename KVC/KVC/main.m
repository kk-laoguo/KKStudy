//
//  main.m
//  KVC
//
//  Created by zainguo on 2019/10/25.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Boy.h"
#import "Observer.h"
#import "Man.h"



/**
 查看setKey:方法是否存在, 如果存在直接调用, 如果不存在进入下一步
 查看_setKey:方法是否存在, 如果存在直接调用, 如果不存在进入下一步
 查看+ (BOOL)accessInstanceVariablesDirectly方法的返回值, 默认返回YES
 
 YES: 可以访问成员变量, 进入下一步
 NO: 不可以访问成员变量, 同时调用- (void)setValue:(id)value forUndefinedKey:(NSString *)key方法, 如果方法不存在会抛出异常
 
 调用成员变量:_key, _isKey, key, isKey
 
 调用顺序, 从左到右, 只有发现存在成员变量, 就不会在调用后续变量
 如果没有成员变量, 会调用- (void)setValue:(id)value forUndefinedKey:(NSString *)key方法, 如果方法不存在会抛出异常
 
 作者：冰凌天
 链接：https://juejin.im/post/5b74444c518825613b604e27
 来源：掘金
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [Person new];
        [person setValue:@"李四" forKey:@"name"];
        NSLog(@"%@", [person valueForKey:@"name"]);
        
        Cat *cat = [Cat new];
        person.cat = cat;
        
        [cat setValue:@10 forKey:@"weight"];
        NSLog(@"%@", [cat valueForKey:@"weight"]);
        
        Boy *boy = [Boy new];
        
        // kvc赋值
//        [boy setValue:@"boy" forKey:@"name"];
//        NSLog(@"%@", [boy valueForKey:@"_name"]);
//        NSLog(@"%@", [boy valueForKey:@"_isName"]);
//        NSLog(@"%@", [boy valueForKey:@"name"]);
//        NSLog(@"%@", [boy valueForKey:@"isName"]);
        
        
        // 取值
//        boy->_name = @"1";
//        boy->isName = @"2";
//        boy->_isName = @"3";
//        boy->name = @"4";
//        // kvc取值
//        NSLog(@"%@",[boy valueForKey:@"name"]);

        
        // 验证KVC赋值时, 会触发KVO吗?
        
        Observer *observer = [[Observer alloc] init];
        Man *man = [[Man alloc] init];
        man.weight = 100;
        
        NSKeyValueObservingOptions options = NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew;
        
        // 添加KVO
//        [man addObserver:observer forKeyPath:@"weight" options:options context:nil];
//        [man setValue:@190 forKey:@"weight"];
        
        [man addObserver:observer forKeyPath:@"age" options:options context:nil];
        [man setValue:@190 forKey:@"age"];
        
        
    }
    return 0;
}
