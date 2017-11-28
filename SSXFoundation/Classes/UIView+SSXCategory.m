//
//  UIView+LDCategory.m
//  Expecta
//
//  Created by sishengxiu on 2017/11/8.
//

#import "UIView+SSXCategory.h"

static const NSString * CSToastActivityViewKey  = @"CSToastActivityViewKey";
static const CGFloat CSToastMaxWidth            = 0.8;      // 80% of parent view width
static const CGFloat CSToastMaxHeight           = 0.8;      // 80% of parent view height
static const CGFloat CSToastHorizontalPadding   = 10.0;
static const CGFloat CSToastVerticalPadding     = 10.0;
static const CGFloat CSToastCornerRadius        = 10.0;
static const CGFloat CSToastOpacity             = 0.8;
static const CGFloat CSToastFontSize            = 13.0;
static const CGFloat CSToastFadeDuration        = 1.0;

// shadow appearance
static const CGFloat CSToastShadowOpacity       = 0.8;
static const CGFloat CSToastShadowRadius        = 6.0;
static const CGSize  CSToastShadowOffset        = { 4.0, 4.0 };
static const BOOL    CSToastDisplayShadow       = NO;

// image view size
static const CGFloat CSToastImageViewWidth      = 80.0;
static const CGFloat CSToastImageViewHeight     = 80.0;

// activity
static const CGFloat CSToastActivityWidth       = 100.0;
static const CGFloat CSToastActivityHeight      = 100.0;

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

#pragma mark frame相关
- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)minX
{
    return self.frame.origin.x;
}

- (CGFloat)maxX
{
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)minY
{
    return self.frame.origin.y;
}
- (CGFloat)maxY
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

#pragma mark 提示信息

#pragma mark 提示信息
- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(SHOW_POSITION)position{
    UIView *toast = [self viewForMessage:message];
    [self showToast:toast duration:interval position:position];
}

- (UIView *)viewForMessage:(NSString *)message{
    // sanity
  
    UILabel *messageLabel = nil;

    
    // create the parent view
    UIView *wrapperView = [[UIView alloc] init];
    wrapperView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    wrapperView.layer.cornerRadius = 10;
    
    if (CSToastDisplayShadow) {
        wrapperView.layer.shadowColor = [UIColor blackColor].CGColor;
        wrapperView.layer.shadowOpacity = CSToastShadowOpacity;
        wrapperView.layer.shadowRadius = CSToastShadowRadius;
        wrapperView.layer.shadowOffset = CSToastShadowOffset;
    }
    
    wrapperView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:CSToastOpacity];
    

    
    if (message != nil) {
        messageLabel = [[UILabel alloc] init];
        messageLabel.numberOfLines = 0;
        messageLabel.font = [UIFont systemFontOfSize:CSToastFontSize];
        messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.alpha = 1.0;
        messageLabel.text = message;
        
        // size the message label according to the length of the text
        CGSize maxSizeMessage = CGSizeMake((self.bounds.size.width * CSToastMaxWidth), self.bounds.size.height * CSToastMaxHeight);
        CGSize expectedSizeMessage = [message boundingRectWithSize:maxSizeMessage
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:@{NSFontAttributeName:messageLabel.font}
                                                           context:nil].size;
        messageLabel.frame = CGRectMake(0.0, 0.0, ceil(expectedSizeMessage.width), ceil(expectedSizeMessage.height));
    }
    // messageLabel frame values
    CGFloat messageWidth, messageHeight, messageLeft, messageTop;
    
    if(messageLabel != nil) {
        messageWidth = messageLabel.bounds.size.width;
        messageHeight = messageLabel.bounds.size.height;
        messageLeft = CSToastHorizontalPadding;
        messageTop = CSToastVerticalPadding;
    } else {
        messageWidth = messageHeight = messageLeft = messageTop = 0.0;
    }
    CGFloat wrapperWidth = MAX((CSToastHorizontalPadding * 2), (messageLeft + messageWidth + CSToastHorizontalPadding));
    CGFloat wrapperHeight = MAX((messageTop + messageHeight + CSToastVerticalPadding), CSToastVerticalPadding * 2);
    wrapperView.frame = CGRectMake(0.0, 0.0, wrapperWidth, wrapperHeight);
    if(messageLabel != nil) {
        messageLabel.frame = CGRectMake(messageLeft, messageTop, messageWidth, messageHeight);
        [wrapperView addSubview:messageLabel];
    }
    return wrapperView;
}

- (void)showToast:(UIView *)toast duration:(CGFloat)interval position:(SHOW_POSITION)position{
    CGPoint toastCenter;
    switch (position) {
        case SHOW_TOP:
            toastCenter = CGPointMake(self.bounds.size.width/2, (toast.frame.size.height / 2) + CSToastVerticalPadding + 64);
            break;
        case SHOW_CENTER:
            toastCenter = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
            break;
        case SHOW_BOTTOM:
            toastCenter = CGPointMake(self.bounds.size.width/2, (self.bounds.size.height - (toast.frame.size.height / 2)) - CSToastVerticalPadding - 49);
            break;
    }
    toast.center = toastCenter;
    toast.alpha = 0.0;
    [self addSubview:toast];
    [UIView animateWithDuration:CSToastFadeDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         toast.alpha = 0.8;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:CSToastFadeDuration
                                               delay:interval
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              toast.alpha = 0.0;
                                          } completion:^(BOOL finished) {
                                              [toast removeFromSuperview];
                                          }];
                     }];
}


-(void)endUpShowingToast:(NSTimer *)timer{
    UIView *toastView = (UIView *)timer.userInfo;
    [UIView animateWithDuration:0.5 animations:^{
        toastView.alpha = 0;
    } completion:^(BOOL finished) {
        [toastView removeFromSuperview];
    }];
}


@end
