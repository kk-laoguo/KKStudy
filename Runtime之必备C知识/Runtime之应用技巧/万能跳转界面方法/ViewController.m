//
//  ViewController.m
//  万能跳转界面方法
//
//  Created by zainguo on 2019/7/14.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentCtr;

@end

@implementation ViewController
- (IBAction)btnAct:(id)sender {
    NSDictionary *info = nil;
    switch (self.segmentCtr.selectedSegmentIndex) {
        case 0:
            info = @{
                     @"class": @"PersonController",
                     @"property": @{
                             @"name": @"lilei"
                             }
                     };
            break;
        case 1:
            info = @{
                     @"class": @"StudentController",
                     @"property": @{
                             @"age": @"20",
                             @"sex": @"男"
                             }
                     };
            break;
        case 2:
            info = @{
                     @"class": @"TeacherController",
                     @"property": @{
                             @"teacherId": @"123456",
                             @"money": @"200000"
                             }
                     };
            break;
        case 3:
            info = @{
                     @"class": @"WorkerController",
                     @"property": @{
                             @"phoneNumber": @"123456"
                             }
                     };
            break;
            
        default:
            break;
    }
    [self pushToControllerWithData:info];

}
- (void)pushToControllerWithData:(NSDictionary *)vcData {
    
    const char *className = [vcData[@"class"] UTF8String];
    Class cls = objc_getClass(className);
    if (!cls) {
        /*
         *1.创建新的类，并且添加变量，添加方法
         */
        Class superClass = [UIViewController class];
        cls = objc_allocateClassPair(superClass, className, 0);
        class_addIvar(cls, "phoneNumber", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
        class_addIvar(cls, "lbl", sizeof(UILabel *), log2(sizeof(UILabel *)), @encode(UILabel *));
        objc_registerClassPair(cls);
        //添加方法，执行viewDidLoad加载
        Method method = class_getInstanceMethod([self class], @selector(workerLoad));
        IMP methodIMP = method_getImplementation(method);
        const char * types = method_getTypeEncoding(method);
        class_addMethod(cls, @selector(viewDidLoad), methodIMP, types);
    }
    /*
     *2.创建实例对象，给属性赋值
     */
    id instance = nil;
    @try {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        instance = [storyboard instantiateViewControllerWithIdentifier:vcData[@"class"]];
        
    } @catch (NSException *exception) {
        instance = [[cls alloc]init];

    } @finally {
        
    }
    NSDictionary *values = vcData[@"property"];
    [values enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //检测是否存在为key的属性
        if (class_getProperty(cls, [key UTF8String])) {
            [instance setValue:obj forKey:key];
        }
        //检测是否存在为key的变量
        else if (class_getInstanceVariable(cls, [key UTF8String])) {
            [instance setValue:obj forKey:key];
        }

    }];
    /*
     *3.跳转到对应的Controller
     */
    [self.navigationController pushViewController:instance animated:YES];


}
- (void)viewDidLoad {
    [super viewDidLoad];
}
/*
 *转换成C++代码后，默认有两个参数(id self,SEL _cmd)
 */
- (void)workerLoad {
    [super viewDidLoad];
    SEL methond = _cmd;
    [self setValue:[UIColor magentaColor] forKeyPath:@"view.backgroundColor"];
    [self setValue:[[UILabel alloc]initWithFrame:CGRectMake(150, 200, 80, 30)] forKey:@"lbl"];
    UILabel *lbl = [self valueForKey:@"lbl"];
    //添加到视图上
    [[self valueForKey:@"view"] performSelector:@selector(addSubview:) withObject:lbl];
    //lbl属性
    lbl.textColor = [UIColor blackColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font = [UIFont systemFontOfSize:20];
    lbl.backgroundColor = [UIColor whiteColor];
    lbl.text = [self valueForKey:@"phoneNumber"];

}

@end
