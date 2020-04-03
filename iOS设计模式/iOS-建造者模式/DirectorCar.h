//
//  DirectorCar.h
//  iOS-建造者模式
//
//  Created by zainguo on 2019/10/22.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderCar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DirectorCar : NSObject

+ (BuilderCar *)createBuilderCar:(BuilderCar *)builderCar;


@end

NS_ASSUME_NONNULL_END
