//
//  NSString+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (YXAddition)

/**
 转为 Data
 */
@property (nonatomic, copy, readonly) NSData *yx_data;
/**
 转为 base64string后的Data
 */
@property (nonatomic, copy, readonly) NSData *yx_base64Data;
/**
 转为 base64String
 */
@property (nonatomic, copy, readonly) NSString *yx_base64Str;
/**
 解 base64str 为 string 解不了就返回原始的数值
 */
@property (nonatomic, copy, readonly) NSString *yx_decodeBase64;
/**
 32位MD5加密
 */
@property (nonatomic, copy, readonly) NSString *yx_MD5;
/**
 SHA1加密
 */
@property (nonatomic, copy, readonly) NSString *yx_SHA1;
/**
 URLencode
 */
@property (nonatomic, copy, readonly) NSString *yx_urlEncodeString;
/**
 URLdecode
 */
@property (nonatomic, copy, readonly) NSString *yx_urlDecodeString;
/**
 AES 加密
 */
@property (nonatomic, copy, readonly) NSString *yx_encryptWithAES;
/**
 AES 解密
 */
@property (nonatomic, copy, readonly) NSString *yx_decryptWithAES;
/**
 AES ECB 加密
 */
- (NSString *)yx_AES128ECBModeEncryptWithKey:(NSString *)key;
/**
 AES 解密
 */
- (NSString *)yx_AES128ECBDecrypWithKey:(NSString *)key;

/**
 判读是否为空
 */
- (BOOL)yx_isEmpty;
/**
 验证邮箱是否合法
 */
- (BOOL)yx_isValidEmail;
/**
 验证手机号码合法性
 */
- (BOOL)yx_isValidPhone;
/**
 验证电话号码合法性
 */
- (BOOL)yx_isValidTel;
/**
 验证身份证号码
 */
- (BOOL)yx_isValidPersonID;
/**
 验证银行卡
 */
- (BOOL)yx_isValidBankNum;
/**
 获取UUID
 */
+ (NSString *)yx_UUID;
/**
 获取版本号
 */
+ (NSString *)yx_systemVersion;

/**
 获取height
 */
- (CGFloat)yx_heightWithFont:(NSInteger)font width:(CGFloat)w;

/**
 获取height
 @param font font
 @param w width
 @param space space
 @return height
 */
- (CGFloat)yx_heightWithFont:(NSInteger)font width:(CGFloat)w lineSpace:(CGFloat)space;
/**
 width
 @param font font description
 @param h h description
 @return return value description
 */
- (CGFloat)yx_widthWithFont:(NSInteger)font h:(CGFloat)h;
/**
 * 获取url参数
 */
- (NSMutableDictionary *)yx_urlParameters;


@end

NS_ASSUME_NONNULL_END
