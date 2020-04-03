//
//  ViewController.h
//  HttpCookie
//
//  Created by zainguo on 2020/2/28.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void)setCookieWithDomain:(NSString*)domainValue
                sessionName:(NSString *)name
               sessionValue:(NSString *)value
                expiresDate:(NSDate *)date;


@end

