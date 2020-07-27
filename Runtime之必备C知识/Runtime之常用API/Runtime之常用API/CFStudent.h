//
//  CFStudent.h
//  Runtime之常用API
//
//  Created by zainguo on 2019/7/3.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 *协议(包含实例方法、类方、实例属性)
 */
@protocol BorrowRule    //借进来
@property(nonatomic,assign)NSInteger bookNum;
@optional
- (void)borrowBook;
@end
@protocol LendRule      //借出去
@optional
+ (void)lendBook;
@end


@interface CFStudent : NSObject <BorrowRule>
@property (nonatomic, assign) BOOL sex;


/*
 *公有实例方法
 */
- (void)playing;
- (void)eatingWithFood:(NSString *)foodName inPlace:(NSString*)placeName;
/*
 *类方法
 */
+ (void)sleeping;

@end

