//
//  PersonController.m
//  万能跳转界面方法
//
//  Created by zainguo on 2019/7/15.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "PersonController.h"

@interface PersonController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation PersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbl.text=[NSString stringWithFormat:@"name=%@",self.name];
}



@end
