//
//  main.m
//  iOS-单例模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//  https://ityongzhen.github.io/iOS设计模式之(三)单例模式.html

#import <Foundation/Foundation.h>

#import "Animal.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        [Animal sharedInstance];
        [Animal sharedInstance];
        [Animal sharedInstance];
        [Animal sharedInstance];
        [Animal sharedInstance];
        [Animal sharedInstance];
        
    }
    return 0;
}
