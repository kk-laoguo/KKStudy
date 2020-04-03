//
//  CaiXinDeviceInline.h
//  CaiXinSDKExample
//
//  Created by zainguo on 2019/4/28.
//  Copyright © 2019 zainguo. All rights reserved.
//

#ifndef CaiXinDeviceInline_h
#define CaiXinDeviceInline_h

/**判读是否有刘海**/
static inline BOOL isIPhoneX() {
    BOOL iPhoneX = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneX;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneX = YES;
        }
    }
    return iPhoneX;
}

#endif /* CaiXinDeviceInline_h */
