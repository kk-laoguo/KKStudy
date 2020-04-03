//
//  KCHomeModel.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCHomeModel.h"

#import <objc/runtime.h>

@implementation KCHomeModel

- (void)logName:(NSString *)name {
    NSLog(@"logName == %@", name);
}

void dynamicMethodIMP(id self, SEL _cmd, NSString *name) {
    NSLog(@"name ==== %@", name);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(logName:)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:@@@");
    }
    
    return [super resolveInstanceMethod:sel];
}


@end
