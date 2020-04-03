//
//  ViewController.m
//  001---RACCommand
//
//  Created by Cooci on 2018/5/20.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC.h>
#import "LoginViewModel.h"
#import <SVProgressHUD.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statuslabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic, strong) LoginViewModel *loginVM;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //绑定 视图 和 viewModel
    [self bindViewModel];

}

- (void)bindViewModel{

    @weakify(self)
    
    RAC(self.loginVM,account) = self.accountTF.rac_textSignal;
    RAC(self.loginVM,password) = self.passwordTF.rac_textSignal;
    RAC(self.loginButton,enabled) = self.loginVM.loginEnableSignal;
    RAC(self.statuslabel,text) = self.loginVM.statusSubject;
    
    
    //头像信号的订阅
    [RACObserve(self.loginVM, iconUrl) subscribeNext:^(id  _Nullable x) {
       //SD AF url
        @strongify(self);
        self.iconImageView.image = [UIImage imageNamed:x];
    }];
    
    //登录按钮能否点击
    [self.loginVM.loginEnableSignal subscribeNext:^(NSNumber * x) {
       @strongify(self);
        UIColor *backgroundColor = (x.integerValue == 0)?[UIColor lightGrayColor]:[UIColor blueColor];
        [self.loginButton setBackgroundColor:backgroundColor];
    }];
    
    
    //登录请求
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        //登录事件
        [self.loginVM.loginCommand execute:@"给我登录"];
    }];
    
   
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"%@",self.loginVM.account);
}


#pragma mark - LAZY
- (LoginViewModel *)loginVM{
    if (!_loginVM) {
        _loginVM = [[LoginViewModel alloc] init];
    }
    return _loginVM;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
