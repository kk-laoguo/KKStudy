//
//  NSObject+CFCoding.m
//  自动归档和自动解档
//
//  Created by zainguo on 2019/7/14.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "NSObject+CFCoding.h"
#import <objc/runtime.h>

@implementation NSObject (CFCoding)
- (void)cf_encode:(NSCoder *)coder {
    
    unsigned int outCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = propertyList[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        [coder encodeObject:[self valueForKey:propertyName] forKey:propertyName];
    }
}
- (void)cf_decode:(NSCoder *)decoder {
    unsigned int outCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = propertyList[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id value = [decoder decodeObjectForKey:propertyName];
        [self setValue:value forKey:propertyName];
    }
}

@end
