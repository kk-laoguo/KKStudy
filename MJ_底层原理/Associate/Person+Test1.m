//
//  Person+Test1.m
//  Associate
//
//  Created by zainguo on 2019/11/19.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Person+Test1.h"
#import <objc/runtime.h>

#import <AppKit/AppKit.h>

static const char NameKey;
static const char WeightKey;

static const void *NameKey1 = &NameKey1;
static const void *WeightKey1 = &WeightKey1;

#define kNameKey @"name"
#define kWeight @"weight"

@implementation Person (Test1)
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)name {
    return objc_getAssociatedObject(self, @selector(name));
}

- (void)setWeight:(int)weight {
    objc_setAssociatedObject(self, &WeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (int)weight {
    return [objc_getAssociatedObject(self, &WeightKey) intValue];
}

@end
