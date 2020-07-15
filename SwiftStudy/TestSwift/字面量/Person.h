//
//  Person.h
//  字面量
//
//  Created by zainguo on 2020/7/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

int sum(int a, int b);
void testSwift();

@interface Person : NSObject

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *name;
- (instancetype)initWithAge:(NSInteger)age name:(NSString *)name;
+ (instancetype)personWithAge:(NSInteger)age name:(NSString *)name;

- (void)run;
+ (void)run;

- (void)eat:(NSString *)food other:(NSString *)other;
+ (void)eat:(NSString *)food other:(NSString *)other;


@end

NS_ASSUME_NONNULL_END
