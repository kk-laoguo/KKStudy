//
//  NSDate+YXAddition.m
//  CXMerchant
//
//  Created by zainguo on 2019/4/12.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "NSDate+YXAddition.h"

@implementation NSDate (YXAddition)
/**
 字符时间戳 13位
 @return return value description
 */
- (NSString *)yx_timeStampStr {
    // *1000 是精确到毫秒，不乘就是精确到秒
    NSTimeInterval time = [self timeIntervalSince1970] * 1000;
    NSString *timeSp = [NSString stringWithFormat:@"%.0f", time];
    return timeSp;
}
- (NSString *)yx_timeStamp10Str {
    return [@([self timeIntervalSince1970]).stringValue copy];
}
/**
 长型时间戳
 @return return value description
 */
- (double)yx_timeStamp{
    return [self timeIntervalSince1970];
}
/**
 *@description:获取当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 *@return:当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 */
- (NSDateComponents *)yx_componentsOfDay {
    return [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
}
- (NSUInteger)yx_year {
    return self.yx_componentsOfDay.year;
}
- (NSUInteger)yx_month {
    return self.yx_componentsOfDay.month;
}
- (NSUInteger)yx_day {
    return self.yx_componentsOfDay.day;
}
- (NSUInteger)yx_hour {
    return self.yx_componentsOfDay.hour;
}
- (NSUInteger)yx_minute {
    return self.yx_componentsOfDay.minute;
}
- (NSUInteger)yx_second {
    return self.yx_componentsOfDay.minute;
}
- (NSUInteger)yx_weekday {
    return self.yx_componentsOfDay.weekday;
}
+ (NSDate *)yx_dateOfDaysAgo:(NSInteger)day {
    NSDate *date = [NSDate date];
    NSTimeInterval time = day * 24 * 60 * 60;
    NSDate *agoDate = [date dateByAddingTimeInterval:-time];
    return agoDate;
}
- (BOOL)yx_isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}
- (BOOL)yx_isYesterday {
    NSDate * now = [NSDate date];
    // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
    // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    // 2014-04-30
    NSString *dateStr = [fmt stringFromDate:self];
    // 2014-10-18
    NSString *nowStr = [fmt stringFromDate:now];
    // 2014-10-30 00:00:00
    NSDate *date = [fmt dateFromString:dateStr];
    // 2014-10-18 00:00:00
    now = [fmt dateFromString:nowStr];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}
- (BOOL)yx_isToday {
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}
/**
 比较两个日期的大小  0 : 相同  1 : oneDay 大  2 : anotherDay 大
 */
+ (NSInteger)yx_compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        //NSLog(@"oneDay  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"oneDay is in the past");
        return 2;
    }
    //NSLog(@"Both dates are the same");
    return 0;
}
/**
 根据年份、月份、日期、小时数、分钟数、秒数返回NSDate
 */
+ (NSDate *)yx_dateWithYear:(NSUInteger)year
                       Month:(NSUInteger)month
                         Day:(NSUInteger)day
                        Hour:(NSUInteger)hour
                      Minute:(NSUInteger)minute
                      Second:(NSUInteger)second {
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    dateComponents.year = year;
    dateComponents.month = month;
    dateComponents.day = day;
    dateComponents.hour = hour;
    dateComponents.minute = minute;
    dateComponents.second = second;
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

/**
 实现dateFormatter单例方法
 @param formatterType type
 @return 相应格式的NSDataFormatter对象
 */
+ (NSDateFormatter *)yx_dateformatterType:(NSString *)formatterType {
    static NSDateFormatter *staticDateFormatter;
    if (!staticDateFormatter) {
        staticDateFormatter = [[NSDateFormatter alloc] init];
    }
    [staticDateFormatter setDateFormat:formatterType];
    return staticDateFormatter;
}
/** YYYY-MM-dd HH:mm:ss */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmmss {
    return [[NSDate yx_dateformatterType:@"YYYY-MM-dd HH:mm:ss"] stringFromDate:self];
}
- (NSString *)yx_dateWithYYYY_MM_dd_HHmm {
    return [[NSDate yx_dateformatterType:@"YYYY-MM-dd HH:mm"] stringFromDate:self];
}
/** YYYY-MM-dd  */
- (NSString *)yx_dateWithYYYY_MM_dd {
    return [[NSDate yx_dateformatterType:@"YYYY-MM-dd"] stringFromDate:self];
    
}
/** YYYY年MM月dd日 HH:mm */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmmInChinese {
    return [[NSDate yx_dateformatterType:@"YYYY年MM月dd日 HH:mm"] stringFromDate:self];
}
- (NSString *)yx_dateWithYYYY_MM_dd_Chinese {
    return [[NSDate yx_dateformatterType:@"YYYY年MM月dd日"] stringFromDate:self];
}

+ (NSDate *)yx_timeStringTransferToDate:(NSString *)timeStr {
    NSDateFormatter *formatter = [NSDate yx_dateformatterType:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:timeStr];
    return date;
}
+ (NSDate *)yx_priousorLaterDateFromDate:(NSDate *)date
                               withMonth:(NSInteger)month {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}

+ (NSString *)yx_getTimeFromTimestamp:(NSString *)timestamp
                        formatterType:(NSString *)formatterType {
    
    if (!formatterType) {
        formatterType = @"YYYY-MM-dd HH:mm:ss";
    }
    if (!timestamp) {
        return nil;
    }
    double timeStamp = [timestamp doubleValue];
    if (timestamp.length == 13) {
        timeStamp = timeStamp/1000;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDateFormatter *dateFormatter = [NSDate yx_dateformatterType:formatterType];
    NSString *time = [dateFormatter stringFromDate:date];
    return time;
}
@end
