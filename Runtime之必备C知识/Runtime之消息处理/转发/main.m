//
//  main.m
//  转发
//
//  Created by zainguo on 2019/7/2.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFPerson.h"

int main(int argc, const char * argv[]) {
    
    CFPerson *person = [[CFPerson alloc]init];
    //把执行playing方法，变成执行person里的eating
    [person performSelector:NSSelectorFromString(@"playing")];
    //把执行studying方法，交给student类
    [person performSelector:NSSelectorFromString(@"studying")];
    return 0;
}
