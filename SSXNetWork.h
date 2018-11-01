//
//  SSXNetWork.h
//  SSXFoundation
//
//  Created by sishengxiu on 2018/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSXNetWork : NSObject

/**
 post请求

 @param urlString 网址
 @param parameters 请求参数
 @param result 结果
 */
+ (void)post:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(nonnull void (^)(BOOL isSuccess, id json))result;


/**
 get请求

 @param urlString 网址
 @param parameters 参数
 @param result 结果
 */
+ (void)get:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(nonnull void (^)(BOOL isSuccess, id json))result;


/**
 上传文件接口

 @param urlString 请求网址
 @param parameters 请求参数
 @param fileArray 文件参数
 @param progress 上传进度
 @param result 上传结果
 */
+ (void)Post:(NSString *)urlString parameters:(NSDictionary *)parameters fileArr:(NSArray *)fileArray progress:(nullable void (^)(CGFloat uploadProgress))progress resultBlock:(nonnull void (^)(BOOL isSuccess, id json))result;

@end

NS_ASSUME_NONNULL_END
