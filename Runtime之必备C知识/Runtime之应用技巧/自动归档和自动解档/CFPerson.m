//
//  CFPerson.m
//  3自动归档和自动解档
//
//  Created by GongCF on 2018/9/16.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFPerson.h"
#import "CFCoding.h"
#import "NSObject+CFCoding.h"

 @implementation CFPerson

//- (void)encodeWithCoder:(NSCoder *)aCoder {
////    [aCoder encodeObject:self.name forKey:@"name"];
////    [aCoder encodeObject:self.icon forKey:@"icon"];
////    [aCoder encodeObject:self.age forKey:@"age"];
////    [aCoder encodeObject:self.height forKey:@"height"];
////    [aCoder encodeObject:self.money forKey:@"money"];
////    [aCoder encodeObject:self.personId forKey:@"personId"];
//
//    [self cf_encode:aCoder];
//
//}
//// 解档
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//
//    if (self = [super init]) {
//        [self cf_decode:aDecoder];
//
////        self.name = [aDecoder decodeObjectForKey:@"name"];
////        self.icon = [aDecoder decodeObjectForKey:@"icon"];
////        self.age = [aDecoder decodeObjectForKey:@"age"];
////        self.height = [aDecoder decodeObjectForKey:@"height"];
////        self.money = [aDecoder decodeObjectForKey:@"money"];
////        self.personId = [aDecoder decodeObjectForKey:@"personId"];
//
//    }
//    return self;
//}



CFAutoCoding

@end
