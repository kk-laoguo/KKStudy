//
//  CFCoding.h
//  自动归档和自动解档
//
//  Created by zainguo on 2019/7/14.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <objc/runtime.h>

#ifndef CFCoding_h
#define CFCoding_h

#define CFAutoCoding \
- (void)encodeWithCoder:(NSCoder *)aCoder\
{\
    unsigned int outCount = 0;\
    objc_property_t *properyList = class_copyPropertyList([self class], &outCount);\
    for (int i=0; i<outCount; i++) {\
    objc_property_t property = properyList[i];\
    NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];\
    [aCoder encodeObject:[self valueForKey:propertyName] forKey:propertyName];\
    }\
}\
- (instancetype)initWithCoder:(NSCoder *)aDecoder\
{\
    self = [super init];\
    if (self) {\
    unsigned int outCount = 0;\
    objc_property_t *properyList = class_copyPropertyList([self class], &outCount);\
    for (int i=0; i<outCount; i++) {\
        objc_property_t property = properyList[i];\
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];\
        id vaue = [aDecoder decodeObjectForKey:propertyName];\
        [self setValue:vaue forKey:propertyName];\
    }\
    }\
    return self;\
}





#endif /* CFCoding_h */
