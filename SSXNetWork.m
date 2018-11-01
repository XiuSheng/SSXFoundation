//
//  SSXNetWork.m
//  SSXFoundation
//
//  Created by sishengxiu on 2018/11/1.
//

#import "SSXNetWork.h"
#import <AFNetworking/AFNetworking.h>
@implementation SSXNetWork

+ (void)post:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(nonnull void (^)(BOOL isSuccess, id json))result{
    
    [[AFHTTPSessionManager manager] POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        result(YES,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        result(NO,nil);
    }];
}

+ (void)get:(NSString *)urlString parameters:(NSDictionary *)parameters resultBlock:(nonnull void (^)(BOOL isSuccess, id json))result{
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        result(YES,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        result(NO,nil);
    }];
}

+ (void)Post:(NSString *)urlString parameters:(NSDictionary *)parameters fileArr:(NSArray *)fileArray progress:(nullable void (^)(CGFloat uploadProgress))progress resultBlock:(nonnull void (^)(BOOL isSuccess, id json))result{
    
    [[AFHTTPSessionManager manager] POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileArray.count; i++) {
            UIImage * image =fileArray[i];
            NSData *data = UIImageJPEGRepresentation(image, 0.7);
            NSString *name =[NSString stringWithFormat:@"image%d.png",i];
            NSString *type = @"image/png";
            [formData appendPartWithFileData:data name:@"file" fileName:name mimeType:type];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress.completedUnitCount);
        NSLog(@"%g",uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        result(YES,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        result(NO,nil);
    }];
    
}


@end
