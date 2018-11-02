//
//  NSObject+SSX.h
//  SSXFoundation
//
//  Created by sishengxiu on 2018/10/31.
//

#import <Foundation/Foundation.h>


@interface NSObject (SSX)

@end

@interface NSString (SSX)

/**
 手机号正则校验
 
 @return 是否是手机号
 */
- (BOOL)isPhoneNumber;

/**
 邮箱正则校验

 @return 是否是邮箱
 */
- (BOOL)isEmail;

/**
 判断是否是数字

 @return 判断结果
 */
- (BOOL)isNumber;
@end

@interface UIDevice (SSX)

/**
 获取手机型号 暂时只支持到iphoneXS MAX

 @return 手机具体型号
 */
+ (NSString *)getCurrentDeviceModel;

@end
