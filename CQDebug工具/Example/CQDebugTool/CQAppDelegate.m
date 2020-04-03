//
//  CQAppDelegate.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "CQAppDelegate.h"
#import "CQDebugTool.h"
#import "CQViewController.h"

@interface CQAppDelegate ()<CQDebugToolDelegate>

@end

@implementation CQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //用标识决定window
    BOOL isAppStoreChannel = NO;
    if (!isAppStoreChannel) {
        self.window = [[CQDebugTool debugInstance] debugWindow];
        [CQDebugTool debugInstance].delegate = self;
    } else {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    [[CQDebugTool debugInstance] appendRequestLog:@"ABCDEFGHIJKL"];
    [CQDebugTool debugInstance].deallocMessageShow = YES;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[CQViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSInteger)numberOfCustomDebugCell {
    return 1;
}

- (UITableViewCell *)customCellForRow:(NSInteger)row {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customCellID"];
    cell.textLabel.text = @"自定义功能";
    return cell;
}

- (void)didSelectCustomCell:(UITableViewCell *)customCell row:(NSInteger)row {
    NSLog(@"%ld",row);
}

- (NSArray<CQUrlContext *> *)UrlContextDataForDevActionSheet {
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:0];
    
    CQUrlContext *devContext1 = [[CQUrlContext alloc] init];
    devContext1.url = @"https://xxx";
    devContext1.devTitle = @"测试环境";
    [data addObject:devContext1];
    
    CQUrlContext *devContext2 = [[CQUrlContext alloc] init];
    devContext2.url = @"https://xxx";
    devContext2.devTitle = @"预生产环境";
    [data addObject:devContext2];
    
    CQUrlContext *devContext3 = [[CQUrlContext alloc] init];
    devContext3.url = @"https://xxx";
    devContext3.devTitle = @"生产环境";
    [data addObject:devContext3];

    return data;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
