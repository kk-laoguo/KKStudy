//
//  CQRequestLogViewController.m
//  CQDebugTool
//
//  Created by luchunqing on 04/16/2019.
//  Copyright (c) 2019 luchunqing. All rights reserved.
//

#import "CQRequestLogViewController.h"
#import "CQDebugTool.h"
@interface CQRequestLogViewController () <UISearchBarDelegate,UITextViewDelegate>
/*  */
@property (nonatomic,strong)UITextView *textView;

@end

@implementation CQRequestLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"清空" style:UIBarButtonItemStylePlain target:self action:@selector(clearLog)];
    
    self.title = @"请求日志";
    [self.view addSubview:self.textView];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self searchWithKeyWord:searchText];
}

- (void)searchWithKeyWord:(NSString *)keyWord {
    _textView.textColor = [UIColor blackColor];
    if ([keyWord length]) {
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:keyWord options:0 error:nil];
        NSArray *matches = [regex matchesInString:_textView.text options:0 range:NSMakeRange(0,_textView.text.length)];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_textView.text];
        for(NSTextCheckingResult *result in [matches objectEnumerator]) {
            NSRange matchRange = [result range];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:matchRange];
        }
        _textView.attributedText = str;
    } else {
        [_textView scrollRangeToVisible:NSMakeRange(0, 0)];
    }
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 104)];
        _textView.delegate = self;
        _textView.editable = NO;
        _textView.text = [[CQDebugTool debugInstance] requestLog];
    }
    return _textView;
}

- (void)clearLog {
    self.textView.text = @"";
    [[CQDebugTool debugInstance] clearRequestLog];
}

@end
