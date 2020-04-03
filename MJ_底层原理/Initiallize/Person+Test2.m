//
//  Person+Test2.m
//  Initiallize
//
//  Created by zainguo on 2019/11/18.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Person+Test2.h"

#import <AppKit/AppKit.h>


@implementation Person (Test2)

+ (void)initialize {
    NSLog(@"Person (Test2) - initialize");
}


+ (void)load {
    NSLog(@"Person (Test2) - load");
}
+ (void)test {
    NSLog(@"Person (Test2)  - test");

}

@end
