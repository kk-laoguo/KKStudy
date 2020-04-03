//
//  BuilderCar.h
//  iOS-建造者模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BuilderCar : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *price;
- (BuilderCar *)makerCar;
@end

NS_ASSUME_NONNULL_END
