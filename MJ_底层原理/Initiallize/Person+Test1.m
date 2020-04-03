//
//  Person+Test1.m
//  Initiallize
//
//  Created by zainguo on 2019/11/18.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Person+Test1.h"

#import <AppKit/AppKit.h>


@implementation Person (Test1)

+ (void)initialize {
    NSLog(@"Person (Test1) - initialize");

}

+ (void)load {
    NSLog(@"Person (Test1) - load");
}
+ (void)test {
    NSLog(@"Person (Test1)  - test");

}

@end
