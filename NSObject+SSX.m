//
//  NSObject+SSX.m
//  SSXFoundation
//
//  Created by sishengxiu on 2018/10/31.
//

#import "NSObject+SSX.h"

@implementation NSObject (SSX)

@end
@implementation NSString (SSX)

- (BOOL)isPhoneNumber
{
    //符合1开头的11位手机号都认为是手机号
    NSString *mobile = @"^1[1-9]\\d{9}$";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    
    if ([regextestcm evaluateWithObject:self] == YES)
        //        || ([regextestct evaluateWithObject:self] == YES)
        //        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


@end
