//
//  StudentController.m
//  万能跳转界面方法
//
//  Created by zainguo on 2019/7/15.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "StudentController.h"

@interface StudentController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;


@end

@implementation StudentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbl.text=[NSString stringWithFormat:@"age=%@,sex=%@",self.age,self.sex];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
