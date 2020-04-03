//
//  YXNetworkManager.m
//  CXMerchant
//
//  Created by zainguo on 2019/4/24.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "YXNetworkManager.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"


#define YXNSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]


@implementation YXNetworkManager

static AFHTTPSessionManager *_sessionManager;
static NSMutableArray *_allSessionTask;
static dispatch_semaphore_t _semaphore;
static dispatch_time_t _overTime;


#pragma mark - 取消请求
+ (void)cancelAllRequest {
    
    dispatch_semaphore_wait(_semaphore, _overTime);
    [[self allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
        [task cancel];
    }];
    [[self allSessionTask] removeAllObjects];
    dispatch_semaphore_signal(_semaphore);
        
}
+ (void)cancelRequestWithURL:(NSString *)URL {
    if (!URL) {
        return;
    }
    dispatch_semaphore_wait(_semaphore, _overTime);
    [[self allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([task.currentRequest.URL.absoluteString hasPrefix:URL]) {
            [task cancel];
            [[self allSessionTask] removeObject:task];
            *stop = YES;
        }
    }];
    dispatch_semaphore_signal(_semaphore);
}

#pragma mark - GET
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
               parameters:(id)parameters
                  success:(YXHttpRequestSuccess)success
                  failure:(YXHttpRequestFailed)failure {

    NSURLSessionTask *sessionTask = [_sessionManager GET:URL
                                              parameters:parameters
                                                progress:^(NSProgress * _Nonnull downloadProgress) {
        // 如果需要填充进度内容，可以直接进行内容添加
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[self allSessionTask] removeObject:task];
        failure ? failure(error, [self statusCode:task]) : nil;
    }];
    
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    return sessionTask;
}

#pragma mark - POST
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                parameters:(id)parameters
                   success:(YXHttpRequestSuccess)success
                   failure:(YXHttpRequestFailed)failure {
    
    NSURLSessionTask *sessionTask = [_sessionManager POST:URL
                                               parameters:parameters
                                                progress:^(NSProgress * _Nonnull uploadProgress) {
        //如果需要填充进度内容，可以直接进行内容添加
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[self allSessionTask] removeObject:task];
        failure ? failure(error, [self statusCode:task]) : nil;
    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;

    return sessionTask;
    
}
#pragma mark - PUT
+ (__kindof NSURLSessionTask *)PUT:(NSString *)URL
                         parameters:(id)parameters
                            success:(YXHttpRequestSuccess)success
                           failure:(YXHttpRequestFailed)failure {
    
    NSURLSessionTask *sessionTask = [_sessionManager PUT:URL
                                              parameters:parameters
                                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[self allSessionTask] removeObject:task];
        failure ? failure(error, [self statusCode:task]) : nil;
        
    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    
    return sessionTask;
    
}
#pragma mark - DELETE
+ (__kindof NSURLSessionTask *)DELETE:(NSString *)URL
                         parameters:(id)parameters
                            success:(YXHttpRequestSuccess)success
                              failure:(YXHttpRequestFailed)failure {
    
    NSURLSessionTask *sessionTask = [_sessionManager DELETE:URL
                                                 parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[self allSessionTask] removeObject:task];
        failure ? failure(error, [self statusCode:task]) : nil;
    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    
    return sessionTask;
}
#pragma mark - HEAD
+ (__kindof NSURLSessionTask *)HEAD:(NSString *)URL
                         parameters:(id)parameters
                            success:(YXHttpRequestSuccess)success
                            failure:(YXHttpRequestFailed)failure {
    
    NSURLSessionTask *sessionTask = [_sessionManager HEAD:URL
                                               parameters:parameters
                                                  success:^(NSURLSessionDataTask * _Nonnull task) {
        [[self allSessionTask] removeObject:task];
        success ? success(nil) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[self allSessionTask] removeObject:task];
        failure ? failure(error, [self statusCode:task]) : nil;
    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    
    return sessionTask;
    
}

#pragma mark - PATCH
+ (__kindof NSURLSessionTask *)PATCH:(NSString *)URL
                         parameters:(id)parameters
                            success:(YXHttpRequestSuccess)success
                            failure:(YXHttpRequestFailed)failure {
    
    NSURLSessionTask *sessionTask = [_sessionManager PATCH:URL
                                                parameters:parameters
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [[self allSessionTask] removeObject:task];
        success ? success(nil) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[self allSessionTask] removeObject:task];
        failure ? failure(error, [self statusCode:task]) : nil;
        
    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    
    return sessionTask;
}

#pragma mark - 上传文件
+ (__kindof NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
                             parameters:(id)parameters
                                   name:(NSString *)name
                               filePath:(NSString *)filePath
                               progress:(YXHttpProgress)progress
                                success:(YXHttpRequestSuccess)success
                                failure:(YXHttpRequestFailed)failure {
    
    NSURLSessionTask *sessionTask = [_sessionManager POST:URL
                                               parameters:parameters
                                constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSError *error = nil;
        [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:name error:&error];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
        [[self allSessionTask] removeObject:task];
        failure ? failure(error, [self statusCode:task]) : nil;

    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    return sessionTask;
}

#pragma mark - 上传多张图片
+ (__kindof NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                               parameters:(id)parameters
                                     name:(NSString *)name
                                   images:(NSArray<UIImage *> *)images
                                fileNames:(NSArray<NSString *> *)fileNames
                               imageScale:(CGFloat)imageScale
                                imageType:(NSString *)imageType
                                 progress:(YXHttpProgress)progress
                                  success:(YXHttpRequestSuccess)success
                                  failure:(YXHttpRequestFailed)failure {
    
    NSURLSessionTask *sessionTask = [_sessionManager POST:URL
                                               parameters:parameters
                                constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSUInteger i = 0; i < images.count; i ++) {
            // 图片经过等比压缩后得到的二进制文件
            NSData *imageData = UIImageJPEGRepresentation(images[i], imageScale ? :1.f);
            // 默认图片的文件名, 若fileNames为nil就使用
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd-HH-mm-ss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *imageFileName = YXNSStringFormat(@"%@%zd.%@", str, i, imageType ? :@"jpg");
            [formData appendPartWithFileData:imageData
                                        name:name
                                    fileName:fileNames ? YXNSStringFormat(@"%@.%@",fileNames[i],imageType?:@"jpg") : imageFileName mimeType:YXNSStringFormat(@"image/%@",imageType ?: @"jpg")];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        [[self allSessionTask] removeObject:task];
        failure ? failure(error, [self statusCode:task]) : nil;
    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    return sessionTask;
    
}

#pragma mark - 下载文件
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
                              fileDir:(NSString *)fileDir
                             progress:(YXHttpProgress)progress
                              success:(void(^)(NSString *filePath))success
                              failure:(YXHttpRequestFailed)failure {
    
    // 下载地址
    NSURL *downloadURL = [NSURL URLWithString:URL];
    // 设置请求
    NSURLRequest *request = [NSURLRequest requestWithURL:downloadURL];
    // 下载操作
    __block NSURLSessionDownloadTask *downloadTask = [_sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //下载进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(downloadProgress) : nil;
        });
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 拼接缓存目录
        NSString *downloadDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:fileDir ? fileDir : @"Download"];
        // 打开文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // 创建Download目录
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        // 拼接文件路径
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        // 返回文件位置的URL路径
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
      
        [[self allSessionTask] removeObject:downloadTask];
        if (failure && error) {
            NSHTTPURLResponse *taskRes = (NSHTTPURLResponse *)downloadTask.response;
            NSInteger statusCode = taskRes.statusCode;
            failure(error, statusCode);
        }
        success ? success(filePath.absoluteString /** NSURL->NSString*/) : nil;

    }];
    // 开始下载
    [downloadTask resume];
    // 添加sessionTask到数组
    downloadTask ? [[self allSessionTask] addObject:downloadTask] : nil;
    
    return downloadTask;
    
}
+ (NSMutableArray *)allSessionTask {
    if (!_allSessionTask) {
        _allSessionTask = [[NSMutableArray alloc] init];
    }
    return _allSessionTask;
}
+ (NSInteger)statusCode:(NSURLSessionDataTask *)task {
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    NSInteger statusCode = response.statusCode;
    return statusCode;
}

#pragma mark - 网络状态
+ (void)networkStatusWithBlock:(YXNetworkStatus)networkStatus {
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                networkStatus ? networkStatus(YXNetworkStatusUnknown) : nil;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                networkStatus ? networkStatus(YXNetworkStatusNotReachable) : nil;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                networkStatus ? networkStatus(YXNetworkStatusReachableViaWWAN) : nil;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                networkStatus ? networkStatus(YXNetworkStatusReachableViaWiFi) : nil;
                break;
                
            default:
                break;
        }
        
    }];
}
+ (BOOL)isNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

+ (BOOL)isWWANNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
}

+ (BOOL)isWiFiNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}
#pragma mark - 初始化AFHTTPSessionManager相关属性
+ (void)load {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
+ (void)initialize {
    _semaphore = dispatch_semaphore_create(1);
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.requestSerializer.timeoutInterval = 20.0;
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", nil];
    //处理网络请求的返回的数据Null问题
    ((AFJSONResponseSerializer *)_sessionManager.responseSerializer).removesKeysWithNullValues = YES;
    // 打开状态栏的等待菊花
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
}
#pragma mark - 重置AFHTTPSessionManager相关属性

+ (void)setAFHTTPSessionManagerProperty:(void(^)(AFHTTPSessionManager *sessionManager))sessionManager {
    sessionManager ? sessionManager(_sessionManager) : nil;
}

+ (void)setRequestSerializer:(YXRequestSerializer)requestSerializer {
    
    _sessionManager.requestSerializer = requestSerializer == YXRequestSerializerHTTP ? [AFHTTPRequestSerializer serializer] : [AFJSONRequestSerializer serializer];
}
+ (void)setResponseSerializer:(YXResponseSerializer)responseSerializer {
    
    _sessionManager.responseSerializer = responseSerializer == YXResponseSerializerHTTP ? [AFHTTPResponseSerializer serializer] : [AFJSONResponseSerializer serializer];
}
+ (void)setRequestTimeoutInterval:(NSTimeInterval)time {
    _sessionManager.requestSerializer.timeoutInterval = time;
}

+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field {
    [_sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}

+ (void)openNetworkActivityIndicator:(BOOL)open {
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:open];
}

+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName {
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    // 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // 如果需要验证自建证书(无效证书)，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    // 是否需要验证域名，默认为YES;
    securityPolicy.validatesDomainName = validatesDomainName;
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    
    [_sessionManager setSecurityPolicy:securityPolicy];
}

@end


#pragma mark - NSDictionary,NSArray的分类
/*
 ************************************************************************************
 *新建NSDictionary与NSArray的分类, 控制台打印json数据中的中文
 ************************************************************************************
 */

#ifdef DEBUG




@implementation NSArray (YXLog)
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@")"];
    
    return strM;
}

@end

@implementation NSDictionary (YXLog)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}
@end


#endif
