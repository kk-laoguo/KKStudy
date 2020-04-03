//
//  CQDebugViewController.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "CQDebugViewController.h"
#import "CQRequestLogViewController.h"
#import "BlocksKit+UIKit.h"
#import "CQDebugTool.h"
@interface CQDebugViewController () <
    UITableViewDelegate,
    UITableViewDataSource
>

/* 表单 */
@property (nonatomic,strong)UITableView *debugTable;

/* 关闭按钮 */
@property (nonatomic,strong)UIButton *closeBtn;

@end

@implementation CQDebugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger customRow = 2;
    if ([CQDebugTool debugInstance].delegate && [[CQDebugTool debugInstance].delegate respondsToSelector:@selector(numberOfCustomDebugCell)]) {
        customRow += [[CQDebugTool debugInstance].delegate numberOfCustomDebugCell];
    }
    return customRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 || indexPath.row == 1) {
        static NSString *DebugCellID = @"CQDebugTableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DebugCellID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DebugCellID];
        }
        if (indexPath.row == 0) {
            cell.textLabel.text = [NSString stringWithFormat:@"当前环境:%@(点击更改)",[CQDebugTool debugInstance].currentUrlContext.devTitle];
        } else {
            cell.textLabel.text = @"请求日志";
        }
        return cell;
    } else {
        if ([CQDebugTool debugInstance].delegate && [[CQDebugTool debugInstance].delegate respondsToSelector:@selector(customCellForRow:)]) {
            return [[CQDebugTool debugInstance].delegate customCellForRow:indexPath.row];
        } else {
            return nil;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 0) {
        UIAlertController *sheetCon = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"当前环境地址\n%@",[CQDebugTool debugInstance].currentUrlContext.url] message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
        NSArray * urlContextData = [[CQDebugTool debugInstance].delegate UrlContextDataForDevActionSheet];
        for (NSInteger i = 0; i < urlContextData.count; i ++) {
            CQUrlContext *devContext = urlContextData[i];
            UIAlertAction *action = [UIAlertAction actionWithTitle:devContext.devTitle style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                cell.textLabel.text = [NSString stringWithFormat:@"当前环境:%@(点击更改)",devContext.devTitle];
                [CQDebugTool debugInstance].currentUrlContext = devContext;
            }];
            [sheetCon addAction:action];
        }
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
        [sheetCon addAction:action];
        [self presentViewController:sheetCon animated:YES completion:nil] ;
    } else if (indexPath.row == 1) {
        CQRequestLogViewController *vc = [[CQRequestLogViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        if ([CQDebugTool debugInstance].delegate && [[CQDebugTool debugInstance].delegate respondsToSelector:@selector(didSelectCustomCell:row:)]) {
            [[CQDebugTool debugInstance].delegate didSelectCustomCell:cell row:indexPath.row];
        }
    }
}

- (void)initView {
    self.title = @"DebugTool";
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.debugTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height - 44) style:UITableViewStylePlain];
    self.debugTable.delegate = self;
    self.debugTable.dataSource = self;
    self.debugTable.tableFooterView = [UIView new];
    [self.view addSubview:self.debugTable];
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [self.closeBtn setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor]]
                             forState:UIControlStateNormal];
    [self.closeBtn addTarget:self
                      action:@selector(closeAction)
            forControlEvents:UIControlEventTouchUpInside];
    self.closeBtn.frame = CGRectMake(0, screenSize.height - 44, screenSize.width, 44);
    [self.view addSubview:self.closeBtn];
}

- (UIImage*)imageWithColor:(UIColor*)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
