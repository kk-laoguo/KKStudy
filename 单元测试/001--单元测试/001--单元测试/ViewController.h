//
//  ViewController.h
//  001--单元测试
//
//  Created by zainguo on 2019/12/18.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (int)getPlus:(int)num1 num2:(int)num2;

- (void)loadData:(void (^)(id data))dataBlock;

- (void)openCamera;

@end

