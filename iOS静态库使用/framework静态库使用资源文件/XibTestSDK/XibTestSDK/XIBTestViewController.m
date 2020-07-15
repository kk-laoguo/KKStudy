//
//  XIBTestViewController.m
//  XibTestSDK
//
//  Created by zainguo on 2020/6/3.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "XIBTestViewController.h"
#import "NextViewController.h"
#import "XibTestSDK.h"
@interface XIBTestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation XIBTestViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *imagePath = [KKBundleManager filePathFromBundle:@"lufei.png"];
    self.imageView.image = [UIImage imageWithContentsOfFile:imagePath];
    
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//
//    NSURL *url = [bundle URLForResource:@"XibBundle" withExtension:@"bundle"];
//
//    NSBundle *targetBundle = [NSBundle bundleWithURL:url];
//
//    NSString *imagePath = [targetBundle pathForResource:@"lufei" ofType:@"png"];
//
//    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"lufei" ofType:@"png" inDirectory:@"XibBundle.bundle"];
//    self.imageView.image = [UIImage imageWithContentsOfFile:path];
//    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"XibBundle" ofType:@"bundle"]];
    
    /*
    NSString *path = [[NSBundle mainBundle] pathForResource:@"XibTestSDK" ofType:@"framework"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    
//    UIImage *image = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"lufei" ofType:@"png"]];
    
    UIImage *image = [UIImage imageNamed:@"XibBundle.bundle/lufei" inBundle:bundle compatibleWithTraitCollection:nil];

    
    self.imageView.image = image;
     
     */

//
//    self.imageView.image = [UIImage imageNamed:@"lufei.png"
//                                      inBundle:bundle compatibleWithTraitCollection:nil];
}
- (IBAction)next:(id)sender {
    
    
    
//
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"XibTestSDK" ofType:@"framework"];
//    NSBundle *bundle = [NSBundle bundleWithPath:path];
//    NextViewController *vc = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:bundle];
    
    NextViewController *vc = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:[KKBundleManager bundle]];
    [self presentViewController:vc animated:YES completion:nil];
    
}



@end
