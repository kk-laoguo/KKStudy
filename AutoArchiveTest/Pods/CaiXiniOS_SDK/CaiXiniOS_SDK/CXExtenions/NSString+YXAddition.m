//
//  NSString+YXAddition.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "NSString+YXAddition.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


static NSString * const PSW_AES_KEY = @"F3BB038E0A54EAA1";
static NSString * const AES_IV_PARAMETER = @"A-16-Byte-String";

@implementation NSString (YXAddition)

- (NSData *)yx_data {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData *)yx_base64Data {
    return [[NSData alloc] initWithBase64EncodedString:self options:0];
}

- (NSString *)yx_base64Str {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

- (NSString *)yx_decodeBase64 {
    
    NSString *decode = [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:self options:0] encoding:NSUTF8StringEncoding];
    return (decode.length != 0) ? decode : self;

}
- (NSString *)yx_MD5 {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG) strlen(cStr), digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return [result copy];
    
}
- (NSString *)yx_SHA1 {
    const char *cStr = [self UTF8String];
    NSData *data = [NSData dataWithBytes:cStr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG) data.length, digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return [result copy];
}

- (NSString *)yx_urlEncodeString {
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    
    NSString * encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
#pragma clang diagnostic pop
    
    return encodedString;
}

- (NSString *)yx_urlDecodeString {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)self,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
#pragma clang diagnostic pop
    return decodedString;
}

- (NSString *)yx_encryptWithAES {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *AESData = [self AES128operation:kCCEncrypt
                                       data:data
                                        key:PSW_AES_KEY
                                         iv:AES_IV_PARAMETER];
    NSString * baseStr = [AESData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return baseStr;
}
- (NSString *)yx_decryptWithAES {
    
    NSData *baseData = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *AESData = [self AES128operation:kCCDecrypt
                                        data:baseData
                                         key:PSW_AES_KEY
                                          iv:AES_IV_PARAMETER];
    
    NSString *decStr = [[NSString alloc] initWithData:AESData encoding:NSUTF8StringEncoding];
    return decStr;
}
- (NSData *)AES128operation:(CCOperation)operation data:(NSData *)data key:(NSString *)key iv:(NSString *)iv {
    
    // 为结束符'\0' +1
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // IV
    char ivPtr[kCCBlockSizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    // 密文长度 <= 明文长度 + BlockSize
    size_t bufferSize = [data length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptorStatus = CCCrypt(operation,
                                            kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding,
                                            keyPtr,
                                            kCCKeySizeAES128,
                                            ivPtr,
                                            [data bytes],
                                            [data length],
                                            buffer,
                                            bufferSize,
                                            &numBytesEncrypted);
    
    if(cryptorStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}

- (NSString *)yx_AES128ECBModeEncryptWithKey:(NSString *)key {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *AESData = [self AES128ECBoperation:kCCEncrypt data:data key:key];
    NSData *resData = [AESData base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return [self hexStringFromData:resData];
}
- (NSString *)yx_AES128ECBDecrypWithKey:(NSString *)key {
    
    NSData *baseData = [self dataForHexString:self];
    NSData *resData = [[NSData alloc] initWithBase64EncodedData:baseData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *AESData = [self AES128ECBoperation:kCCDecrypt data:resData key:key];
    NSString *decStr = [[NSString alloc] initWithData:AESData encoding:NSUTF8StringEncoding];
    return decStr;
}
// 普通字符串转换为十六进
- (NSString *)hexStringFromData:(NSData *)data {
    
    Byte *bytes = (Byte *)[data bytes];
    // 下面是Byte 转换为16进制。
    NSString *hexStr = @"";
    for(int i=0; i<[data length]; i++) {
        // 16进制数
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i] & 0xff];
        newHexStr = [newHexStr uppercaseString];
        if([newHexStr length] == 1) {
            newHexStr = [NSString stringWithFormat:@"0%@",newHexStr];
        }
        hexStr = [hexStr stringByAppendingString:newHexStr];
    }
    return hexStr;
}
// 十六进制转Data
- (NSData*)dataForHexString:(NSString*)hexString {
    if (hexString == nil) {
        return nil;
    }
    const char* ch = [[hexString lowercaseString] cStringUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* data = [NSMutableData data];
    while (*ch) {
        if (*ch == ' ') {
            continue;
        }
        char byte = 0;
        if ('0' <= *ch && *ch <= '9') {
            byte = *ch - '0';
        }else if ('a' <= *ch && *ch <= 'f') {
            byte = *ch - 'a' + 10;
        }else if ('A' <= *ch && *ch <= 'F') {
            byte = *ch - 'A' + 10;
        }
        ch++;
        byte = byte << 4;
        if (*ch) {
            if ('0' <= *ch && *ch <= '9') {
                byte += *ch - '0';
                
            } else if ('a' <= *ch && *ch <= 'f') {
                byte += *ch - 'a' + 10;
                
            }else if('A' <= *ch && *ch <= 'F'){
                byte += *ch - 'A' + 10;
            }
            ch++;
        }
        [data appendBytes:&byte length:1];
    }
    return data;
}
- (NSData *)AES128ECBoperation:(CCOperation)operation data:(NSData *)data key:(NSString *)keyStr {
    // 为结束符'\0' +1
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [keyStr getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    // 密文长度 <= 明文长度 + BlockSize
    size_t bufferSize = [data length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus status = CCCrypt(operation,
                                     kCCAlgorithmAES128,
                                     kCCOptionPKCS7Padding|kCCOptionECBMode,
                                     keyPtr,
                                     kCCKeySizeAES128,
                                     NULL,
                                     [data bytes],
                                     [data length],
                                     buffer,
                                     bufferSize,
                                     &numBytesEncrypted);
    if(status == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}

- (BOOL)yx_isEmpty {
    
    if ([self isEqualToString:@"(null)"]) {
        return YES;
    }
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    if (self.length < 1) {
        return YES;
    }
    return NO;
}
- (BOOL)yx_isValidEmail {
    
    if([self rangeOfString:@"@"].location != NSNotFound
       && [self rangeOfString:@"."].location != NSNotFound){
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)yx_isValidPhone {
    
//    NSString *regex = @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    NSString *regex = @"^1[0-9]{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL phone = [phoneTest evaluateWithObject:self];
    return phone;
}
- (BOOL)yx_isValidTel {
    
    NSString * regex = @"^0\\d{2,3}[-]?\\d{7,8}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL tel = [phoneTest evaluateWithObject:self];
    return tel;
}
- (BOOL)yx_isValidPersonID {
    
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL)yx_isValidBankNum {
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[self length];
    int lastNum = [[self substringFromIndex:cardNoLength-1] intValue];
    
    NSString * cardNo = [self substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

+ (NSString *)yx_UUID {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge_transfer NSString *) uuid;
}

+ (NSString *)yx_systemVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}
- (CGFloat)yx_heightWithFont:(NSInteger)font width:(CGFloat)w {
    return [self boundingRectWithSize:CGSizeMake(w, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:font] } context:nil].size.height;
}
- (CGFloat)yx_heightWithFont:(NSInteger)font width:(CGFloat)w lineSpace:(CGFloat)space {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    return [self boundingRectWithSize:CGSizeMake(w,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font],NSParagraphStyleAttributeName:style} context:nil].size.height;
}
- (CGFloat)yx_widthWithFont:(NSInteger)font h:(CGFloat)h {
    return [self boundingRectWithSize:CGSizeMake(0, h) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName] context:nil].size.width;
}

- (NSMutableDictionary *)yx_urlParameters {
    
    if (!self.length) {
        return @{}.mutableCopy;
    }
    NSMutableDictionary *params = [NSMutableDictionary   dictionary];
    if ([self containsString:@"&"]) {
        NSArray *urlComponents = [self componentsSeparatedByString:@"&"];
        
        for(NSString *keyValuePair in urlComponents) {
            
            //生成key/value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString*value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            //key不能为nil
            if(key==nil|| value ==nil) continue;
            
            id existValue = [params valueForKey:key];
            if(existValue !=nil) {
                //已存在的值，生成数组。
                if([existValue isKindOfClass:[NSArray class]]) {
                    //已存在的值生成数组
                    NSMutableArray*items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    [params setValue:items forKey:key];
                }else{
                    //非数组
                    [params setValue:@[existValue,value]forKey:key];
                }
                
            }else{
                //设置值
                [params setValue:value forKey:key];
            }
            
        }
    }else {
        //单个参数生成key/value
        NSArray *pairComponents = [self componentsSeparatedByString:@"="];
        if(pairComponents.count == 1) {
            return  @{}.mutableCopy;
        }
        //分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        //key不能为nil
        if(key == nil|| value ==nil) {
        
            return @{}.mutableCopy;
        }
        //设置值
        [params setValue:value forKey:key];
    }
    return params;
}


@end
