//
//  SSXShortCut.m
//  Expecta
//
//  Created by sishengxiu on 2018/10/31.
//

#import "SSXShortCut.h"

@implementation SSXShortCut

+ (UIViewController *)getCurrentVC
{
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    if (!window) {
        return nil;
    }
    UIView *tempView;
    for (UIView *subview in window.subviews) {
        if ([[subview.classForCoder description] isEqualToString:@"UILayoutContainerView"]) {
            tempView = subview;
            break;
        }
    }
    if (!tempView) {
        tempView = [window.subviews lastObject];
    }
    
    id nextResponder = [tempView nextResponder];
    while (![nextResponder isKindOfClass:[UIViewController class]] || [nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UITabBarController class]]) {
        tempView =  [tempView.subviews firstObject];
        
        if (!tempView) {
            return nil;
        }
        nextResponder = [tempView nextResponder];
    }
    return  (UIViewController *)nextResponder;
}

+ (BOOL)isShapedScreen{
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets safeAreaInsets = [[UIApplication sharedApplication].windows firstObject].safeAreaInsets;
        return safeAreaInsets.top==0&&safeAreaInsets.bottom==0&&safeAreaInsets.left==0&&safeAreaInsets.right==0;
    } else {
        // Fallback on earlier versions
        return NO;
    }
}

@end
