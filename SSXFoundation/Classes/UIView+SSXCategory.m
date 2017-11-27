//
//  UIView+LDCategory.m
//  Expecta
//
//  Created by sishengxiu on 2017/11/8.
//

#import "UIView+SSXCategory.h"

@implementation UIView (SSXCategory)

#pragma mark 圆角/边框
- (void)setCornerRadius:(CGFloat)radius
{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
}

- (void)setBorder:(CGFloat)width withColor:(UIColor *)color
{
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:width];
}


@end
