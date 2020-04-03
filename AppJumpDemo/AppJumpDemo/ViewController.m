//
//  ViewController.m
//  AppJumpDemo
//
//  Created by zainguo on 2020/1/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ViewController.h"

@protocol CustomProtocol <NSObject>
@required
- (void)test;

@end

@interface ViewController () <CustomProtocol>
@property (nonatomic, weak) id<CustomProtocol>protocol;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.protocol = self;
    // Do any additional setup after loading the view.
}
- (IBAction)buttonClick:(id)sender {
    
    NSString *stttt = @"cxmerchantapp://";
      NSURL* urlLocal = [NSURL URLWithString:stttt];
      // 判断是否可以启动该 url
      if([[UIApplication sharedApplication] canOpenURL:urlLocal])
      {
          [[UIApplication sharedApplication] openURL:urlLocal];
          NSLog(@"launch AppDemo2 success!");
      }
      else
      {
          NSLog(@"No such url.");
          /// 跳到 appStore 某个 app
          NSURL* urlAppStore = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/tie-lu12306/id564818797?mt=8"];
          [[UIApplication sharedApplication] openURL: urlAppStore];
      }
}


@end
