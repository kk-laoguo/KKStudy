//
//  SensorsAnalyticsSDK.m
//  SensorsSDK
//
//  Created by zainguo on 2020/6/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "SensorsAnalyticsSDK.h"
#import "UIView+SensorsData.h"

#import <UIKit/UIDevice.h>
#import <sys/utsname.h>
#import <objc/runtime.h>

static NSString *const SensorsAnalyticsVersion = @"1.0.0";

@interface SensorsAnalyticsSDK ()
// 是否是将要激活状态
@property (nonatomic, assign) BOOL applicationWillResignActive;


@end

@implementation SensorsAnalyticsSDK
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - Life init
- (instancetype)init {
    self = [super init];
    if (self) {
        _automaticProperties = [self collectAutomaticProperties];
        if (UIApplication.sharedApplication.backgroundTimeRemaining != UIApplicationBackgroundFetchIntervalNever) {
            self.launchedPassively = YES;
        }
        // 添加app状态监听
        [self setupListeners];
    }
    return self;
}

+ (SensorsAnalyticsSDK *)shareInstance {
    static SensorsAnalyticsSDK *sdk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sdk = [[SensorsAnalyticsSDK alloc] init];
    });
    return sdk;
}

#pragma mark - Public Methods
- (void)track:(NSString *)eventName
   properties:(NSDictionary<NSString *,id> *)properties {
    
    [self eventName:eventName properties:properties];
}
#pragma mark - Application lifecycle
- (void)setupListeners {
    // 后台
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(__applicationDidEnterBackground:)
     name:UIApplicationDidEnterBackgroundNotification
     object:nil];
    // 激活App
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(__applicationDidBecomeActive:)
     name:UIApplicationDidBecomeActiveNotification
     object:nil];
    // 即将进入前台
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(__applicationWillResignActive:)
     name:UIApplicationWillResignActiveNotification
     object:nil];
    // UIApplicationDidFinishLaunchingNotification
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(__applicationDidFinishLaunching:)
     name:UIApplicationDidFinishLaunchingNotification
     object:nil];
}
#pragma mark - Private Methods
- (void)__applicationDidFinishLaunching:(NSNotificationCenter *)noti {
    if (self.launchedPassively) {
        // 触发被动启动事件
        [self track:@"$AppStartPassively" properties:nil];
    }
}
- (void)__applicationDidBecomeActive:(NSNotificationCenter *)noti {
    if (self.applicationWillResignActive) {
        self.applicationWillResignActive = NO;
        return;
    }
    // 将被动启动设置为NO
    self.launchedPassively = NO;
    // 触发$AppStart事件
    [self track:@"$AppStart" properties:nil];
}
- (void)__applicationDidEnterBackground:(NSNotification *)noti {
    // 还原标记位
    self.applicationWillResignActive = NO;
    // 触发$AppEnd事件
    [self track:@"$AppEnd" properties:nil];
}
- (void)__applicationWillResignActive:(NSNotification *)noti {
    self.applicationWillResignActive = YES;
}

- (NSDictionary<NSString *, id> *)collectAutomaticProperties {
    NSMutableDictionary *properties = [NSMutableDictionary dictionary];
    // 操作系统
    properties[@"$OS"] = @"iOS";
    // SDK平台版本
    properties[@"$lib"] = @"iOS";
    // 设置制造商
    properties[@"$manufacturer"] = @"Apple";
    // SDK版本
    properties[@"$lib_version"] = SensorsAnalyticsVersion;
    // 手机型号
    properties[@"$model"] = [self deviceVersion];
    // 操作系统版本号
    properties[@"$os_version"] = UIDevice.currentDevice.systemVersion;
    // 应用程序版本号
    properties[@"$app_version"] = NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"];
 
    return [properties copy];
}

- (NSString *)deviceVersion {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

@end

@implementation SensorsAnalyticsSDK (Track)

- (void)trackAppClickWithView:(UIView *)view
                   properties:(NSDictionary<NSString *,id> *)properties {
    
    NSMutableDictionary *eventProperties = [[NSMutableDictionary alloc] init];
    eventProperties[@"$element_type"] = view.sensorsdata_elementType;
    eventProperties[@"$element_content"] = view.sensorsdata_elementContent;
    eventProperties[@"$screen_name"] = NSStringFromClass(view.sensorsdata_viewController.class);
    [eventProperties addEntriesFromDictionary:properties];
    [[SensorsAnalyticsSDK shareInstance] track:@"$AppClick"
                                    properties:eventProperties];
}
- (void)trackAppClickWithTableView:(UITableView *)tableView
           didSelectRowAtIndexPath:(NSIndexPath *)indexPath
                        properties:(NSDictionary<NSString *, id> *)properties {
    
    NSMutableDictionary *eventProperties = [NSMutableDictionary dictionary];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    eventProperties[@"$element_content"] = cell.sensorsdata_elementContent;
    eventProperties[@"$element_position"] = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
    [eventProperties addEntriesFromDictionary:properties];
    [[SensorsAnalyticsSDK shareInstance] trackAppClickWithView:tableView
                                                    properties:eventProperties];
    
}
- (void)eventName:(NSString *)eventName
       properties:(NSDictionary<NSString *, id> *)properties {
    
    NSMutableDictionary *event = [NSMutableDictionary dictionary];
    // 设置事件名称
    event[@"event"] = eventName;
    // 设置事件发生的时间戳 单位为毫秒
    event[@"time"] = [NSNumber numberWithLong:NSDate.date.timeIntervalSince1970 * 1000];
    NSMutableDictionary *eventProperties = [NSMutableDictionary dictionary];
    // 添加预置属性
    [eventProperties addEntriesFromDictionary:self.automaticProperties];
    // 添加自定义属性
    [eventProperties addEntriesFromDictionary:properties];
    // 判读是否为被动启动
    if (self.launchedPassively) {
        eventProperties[@"$app_state"] = @"background";
    }
    // 设置事件属性
    event[@"properties"] = eventProperties;
    
    [self printEvent:event];
}

- (void)printEvent:(NSDictionary *)event {
#if DEBUG
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:event options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return NSLog(@"JSON 解析错误");
    }
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"[Event] =========== \n\n %@", json);
#endif
}

- (void)setLaunchedPassively:(BOOL)launchedPassively {
    objc_setAssociatedObject(self, @selector(launchedPassively), @(launchedPassively), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)launchedPassively {
    return [objc_getAssociatedObject(self, @selector(launchedPassively)) boolValue];
}

@end
