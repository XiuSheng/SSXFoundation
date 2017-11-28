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
//16进制颜色
#define mHexColor(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]
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

#define isPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define StatuBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define NavHeight 44
#define NavAndStatuBar (StatuBarHeight+StatuBarHeight)
#define TabBarHeight (isPhoneX?83:49)

typedef enum SHOW_POSITION {
    SHOW_TOP,//顶部
    SHOW_CENTER,//中部
    SHOW_BOTTOM,//底部
} SHOW_POSITION;
@interface UIView (SSXCategory)
/**
 * 视图坐标
 * @returned    视图坐标
 */
- (CGPoint)origin;

/**
 * 视图相对于父view的最小x坐标
 * @returned    最小x坐标
 */
- (CGFloat)minX;

/**
 * 视图相对于父view的最大x坐标
 * @returned    最大x坐标
 */
- (CGFloat)maxX;

/**
 * 视图相对于父view的最小y坐标
 * @returned    最小y坐标
 */
- (CGFloat)minY;

/**
 * 视图相对于父view的最大y坐标
 * @returned    最大y坐标
 */
- (CGFloat)maxY;

/**
 * 视图高宽
 * @returned    视图高宽
 */
- (CGSize)size;

/**
 * 视图宽
 * @returned    视图宽
 */
- (CGFloat)width;

/**
 * 视图高
 * @returned    视图高
 */
- (CGFloat)height;

/**
 设置圆角

 @param radius 圆角半径
 */
- (void)setCornerRadius:(CGFloat)radius;

/**
 设置线框颜色及线框宽度

 @param width 线框宽度
 @param color 线框颜色
 */
- (void)setBorder:(CGFloat)width withColor:(UIColor *)color;

/**
 makeToast显示

 @param toast 显示内容
 @param duration 显示时间
 @param position 显示位置
 */
- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(SHOW_POSITION)position;
@end
