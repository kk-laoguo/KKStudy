//
//  NSDate+YXAddition.h
//  CXMerchant
//
//  Created by zainguo on 2019/4/12.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (YXAddition)
/**
 字符串时间戳13位
 */
@property (nonatomic, copy, readonly) NSString *yx_timeStampStr;
/**
 字符串时间戳10位
 */
@property (nonatomic, copy, readonly) NSString *yx_timeStamp10Str;
/**
 长型时间戳10位
 */
@property (nonatomic, assign, readonly) double yx_timeStamp;
/**
 *@description:获取当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 *@return:当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 */
- (NSDateComponents *)yx_componentsOfDay;
/**
 判断某个时间是否为今年
 @return return value description
 */
- (BOOL)yx_isThisYear;
/**
 判断某个时间是否为昨天
 @return return value description
 */
- (BOOL)yx_isYesterday;
/**
 判断某个时间是否为今天
 @return return value description
 */
- (BOOL)yx_isToday;
/**
 *@description:获得NSDate对应的年份
 *@return:NSDate对应的年份
 **/
- (NSUInteger)yx_year;
/**
 *@description:获得NSDate对应的月份
 *@return:NSDate对应的月份
 */
- (NSUInteger)yx_month;
/**
 *@description:获得NSDate对应的日期
 *@return:NSDate对应的日期
 */
- (NSUInteger)yx_day;
/**
 *@description:获得NSDate对应的小时数
 *@return:NSDate对应的小时数
 */
- (NSUInteger)yx_hour;
/**
 *@description:获得NSDate对应的分钟数
 *@return:NSDate对应的分钟数
 */
- (NSUInteger)yx_minute;
/**
 *@description:获得NSDate对应的秒数
 *@return:NSDate对应的秒数
 */
- (NSUInteger)yx_second;
/**
 *@description:获得NSDate对应的星期
 *@return:NSDate对应的星期
 */
- (NSUInteger)yx_weekday;
/** 多少天之前的日期 */
+ (NSDate *)yx_dateOfDaysAgo:(NSInteger)day;
/**
 比较两个日期的大小  0 : 相同  1 : oneDay 大  2 : anotherDay 大
 @param oneDay oneDay description
 @param anotherDay anotherDay description
 @return return value description
 */
+ (NSInteger)yx_compareOneDay:(NSDate *)oneDay
                withAnotherDay:(NSDate *)anotherDay;
/**
 根据年份、月份、日期、小时数、分钟数、秒数返回NSDate
 @param year year description
 @param month month description
 @param day day description
 @param hour hour description
 @param minute minute description
 @param second second description
 @return return value description
 */
+ (NSDate *)yx_dateWithYear:(NSUInteger)year
                       Month:(NSUInteger)month
                         Day:(NSUInteger)day
                        Hour:(NSUInteger)hour
                      Minute:(NSUInteger)minute
                      Second:(NSUInteger)second;

/**
 实现dateFormatter单例方法
 @param formatterType  formatter 类型 (如2018-01-01 10:00:00 \ 2018.01.01)
 @return 相应格式的NSDataFormatter对象
 */
+ (NSDateFormatter *)yx_dateformatterType:(NSString *)formatterType;
/** YYYY-MM-dd HH:mm:ss */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmmss;
/** YYYY-MM-dd HH:mm */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmm;
/** YYYY-MM-dd  */
- (NSString *)yx_dateWithYYYY_MM_dd;
/** YYYY年MM月dd日 HH:mm */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmmInChinese;
/** YYYY年MM月dd日 */
- (NSString *)yx_dateWithYYYY_MM_dd_Chinese;
/**
 时间字符串转成NSDate
 @param timeStr 时间字符串
 @return date
 */
+ (NSDate *)yx_timeStringTransferToDate:(NSString *)timeStr;
/**
 时间戳转成时间字符串
 formatterType: 时间格式 默认格式:YYYY-MM-dd HH:mm:ss
 */
+ (NSString *)yx_getTimeFromTimestamp:(NSString *)timestamp
                        formatterType:(NSString *)formatterType;
/*
 * 给一个时间，给一个数，正数是以后n个月，负数是前n个月；
 */
+ (NSDate *)yx_priousorLaterDateFromDate:(NSDate *)date
                               withMonth:(NSInteger)month;





@end

