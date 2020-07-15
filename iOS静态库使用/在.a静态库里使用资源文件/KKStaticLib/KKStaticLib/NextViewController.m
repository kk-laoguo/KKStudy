//
//  NextViewController.m
//  KKStaticLib
//
//  Created by zainguo on 2020/6/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "NextViewController.h"
#import "KKBundleManager.h"

@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSString *path = [KKBundleManager filePathFromBundle:@"lufei.png"];
    self.imageView.image = [UIImage imageWithContentsOfFile:path];
}



@end
