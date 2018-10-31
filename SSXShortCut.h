//
//  SSXShortCut.h
//  Expecta
//
//  Created by sishengxiu on 2018/10/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSXShortCut : NSObject

/**
 获取当前viewcontronller

 @return 当前viewcontronller
 */
+ (UIViewController *)getCurrentVC;

/**
 判断是否是异型屏幕x,xs,xr,xsmax这一类的屏幕

 @return 是否是异型屏幕
 */
+ (BOOL)isShapedScreen;
@end

NS_ASSUME_NONNULL_END
