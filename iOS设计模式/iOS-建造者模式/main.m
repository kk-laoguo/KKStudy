//
//  main.m
//  iOS-建造者模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DirectorCar.h"
#import "BMWCar.h"
#import "AudiCar.h"
#import "BuilderCar.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BMWCar *car = [[BMWCar alloc] init];
        BuilderCar *dir = [DirectorCar createBuilderCar:car];
        NSLog(@"%@",dir.description);
        NSLog(@"Hello, World!");
    }
    return 0;
}
