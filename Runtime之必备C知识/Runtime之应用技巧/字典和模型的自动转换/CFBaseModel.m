//
//  CFBaseModel.m
//  字典和模型的自动转换
//
//  Created by GongCF on 2018/11/10.
//  Copyright © 2018年 GongCF. All rights reserved.
//

#import "CFBaseModel.h"
#import <objc/runtime.h>
@implementation CFBaseModel

- (id)initWithDataDic:(NSDictionary *)data {
    if (self = [super init]) {
        
        unsigned int outCount = 0;
        objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
        /*
         *1.遍历属性，找到对应字典中的value赋给属性
         */
        for (int i = 0; i < outCount; i ++) {
            //获取属性
            objc_property_t property = propertyList[i];
            //获取属性名
            NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
            // value
            id value = [data objectForKey:propertyName];
            //判断是否NSNumber，转换成NSString
            if ([value isKindOfClass:[NSNumber class]]) {
                [self setValue:[value stringValue] forKey:propertyName];
            }
            //判断是否为空，转换成空字符串
            else if ([value isKindOfClass:[NSNull class]]) {
                [self setValue:@"" forKey:propertyName];
            }
            /*
             *2.当字典中value为字典，属性为另外一个model时
             */
            else if ([value isKindOfClass:[NSDictionary class]]) {
                NSString *className = [NSString stringWithUTF8String:property_getAttributes(property)];
                className = [className substringFromIndex:3];
                className = [className substringToIndex:[className rangeOfString:@"\""].location];
                Class modelClass = NSClassFromString(className);
                if (modelClass) {
                    [self setValue:[[modelClass alloc] initWithDataDic:value] forKey:propertyName];
                }
            }
            /*
             *3.当字典中value为数组时，属性为一个model数组时
             */
            else if ([value isKindOfClass:[NSArray class]]) {
                if ([self respondsToSelector:@selector(modelClassInPropertyArr:)]) {
                    NSString *className = [self modelClassInPropertyArr:propertyName];
                    Class modelClass = NSClassFromString(className);
                    NSMutableArray *modelArr = [NSMutableArray array];
                    for (NSDictionary *dic in value) {
                        id model = [[modelClass alloc] initWithDataDic:dic];
                        [modelArr addObject:model];
                    }
                    [self setValue:modelArr forKey:propertyName];
                    
                }
            } else {
                [self setValue:value forKey:propertyName];
            }
        }
        
        free(propertyList);
    }
    return self;
}
//- (id)initWithDataDic:(NSDictionary *)data
//{
//    self = [super init];
//    if (self) {
//        unsigned int outCount = 0;
//        objc_property_t *propertyList =  class_copyPropertyList([self class], &outCount);
//        /*
//         *1.遍历属性，找到对应字典中的value赋给属性
//         */
//        for(int i = 0;i<outCount; i++){
//            //获取属性
//            objc_property_t property = propertyList[i];
//            //获取属性名
//            NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
//            id value  = [data objectForKey:propertyName];
//            //判断是否NSNumber，转换成NSString
//            if([value isKindOfClass:[NSNumber class]])
//            {
//                [self setValue:[value stringValue] forKey:propertyName];
//            }
//            //判断是否为空，转换成空字符串
//            else if ([value isKindOfClass:[NSNull class]])
//            {
//                [self setValue:@"" forKey:propertyName];
//            }
//            /*
//             *2.当字典中value为字典，属性为另外一个model时
//             */
//            else if([value isKindOfClass:[NSDictionary class]])
//            {
//                NSString *className = [NSString stringWithUTF8String:property_getAttributes(property)];
//                className = [className substringFromIndex:3];
//                className = [className substringToIndex:[className rangeOfString:@"\""].location];
//                Class modelClass = NSClassFromString(className);
//                if (modelClass) {
//                    [self setValue:[[modelClass alloc]initWithDataDic:value] forKey:propertyName];
//                }
//            }
//            /*
//             *3.当字典中value为数组时，属性为一个model数组时
//             */
//            else if([value isKindOfClass:[NSArray class]]){
//                if ([self respondsToSelector:@selector(modelClassInPropertyArr:)]) {
//                    NSString *className = [self modelClassInPropertyArr:propertyName];
//                    Class modelClass = NSClassFromString(className);
//                    NSMutableArray *modelArr = [NSMutableArray array];
//                    for (NSDictionary *dic in value) {
//                        id model = [[modelClass alloc]initWithDataDic:dic];
//                        [modelArr addObject:model];
//                    }
//                    [self setValue:modelArr forKey:propertyName];
//                }
//            }else{
//                [self setValue:value forKey:propertyName];
//            }
//        }
//        free(propertyList);
//    }
//    return  self;
//}
@end
