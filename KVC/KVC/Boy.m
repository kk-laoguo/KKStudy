//
//  Boy.m
//  KVC
//
//  Created by zainguo on 2019/10/25.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "Boy.h"

@implementation Boy

#pragma mark - 取值

//- (NSString *)getName {
//    return @"getName";
//}
//- (NSString *)name {
//    return @"name";
//}
//- (NSString *)isName {
//    return @"isName";
//}
//- (NSString *)_name {
//    return @"_name";
//}
+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}
- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"(id)valueForUndefinedKey:(NSString *)key");
    return @"valueForUndefinedKey";
}
#pragma mark - 赋值
//- (void)setName:(NSString *)name {
//    NSLog(@"setName: - %@", name);
//}
//- (void)_setName:(NSString *)name {
//    NSLog(@"_setName: - %@", name);
//}

//+ (BOOL)accessInstanceVariablesDirectly {
//    NSLog(@"accessInstanceVariablesDirectly");
//    return NO;
//}
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    NSLog(@"forUndefinedKey: ----%@", key);
//}


@end
