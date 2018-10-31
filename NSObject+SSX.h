//
//  NSObject+SSX.h
//  SSXFoundation
//
//  Created by sishengxiu on 2018/10/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SSX)

@end

NS_ASSUME_NONNULL_END
@interface NSString (SSX)

/**
 手机号正则校验

 @return 是否是手机号
 */
- (BOOL)isPhoneNumber;
@end
