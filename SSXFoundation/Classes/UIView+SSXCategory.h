//
//  UIView+LDCategory.h
//  Expecta
//
//  Created by sishengxiu on 2017/11/8.
//

#import <UIKit/UIKit.h>


//程序根window
#define APP_WINDOW          (UIWindow*)[[UIApplication sharedApplication].windows objectAtIndex:0]
//定义颜色
#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//随机颜色
#define RANDOMCOLOR         [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1.0]

//判断屏幕类型
#define IS_IPAD             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA           ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH        ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT       ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH   (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH   (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))


#define StatuBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define NavBarHeight 44

#define NavAndStatuBar (StatuBarHeight+StatuBarHeight)

@interface UIView (SSXCategory)
- (void)setCornerRadius:(CGFloat)radius;
- (void)setBorder:(CGFloat)width withColor:(UIColor *)color;
@end
