//
//  SSXViewController.m
//  SSXFoundation
//
//  Created by sishengxiu on 11/27/2017.
//  Copyright (c) 2017 sishengxiu. All rights reserved.
//

#import "SSXViewController.h"
#import "SSXFoundation.h"
@interface SSXViewController ()

@end

@implementation SSXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(20, 70, 80, 30);
    [btn1 setTitle:@"顶部测试" forState:UIControlStateNormal];
    [btn1 setBorder:1 withColor:RGBACOLOR(121, 121, 121, 1)];
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 addTarget:self action:@selector(showToastTop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(20, 140, 80, 30);
    [btn2 setTitle:@"底部测试" forState:UIControlStateNormal];
    [btn2 setBorder:1 withColor:RGBACOLOR(121, 121, 121, 1)];
    [btn2 setCornerRadius:6];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(showToastBottom) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(140, 70, 60, 30);
    [btn3 setTitle:@"中部测试" forState:UIControlStateNormal];
    [btn3 setTitleColor:RGBACOLOR(246, 246, 64, 1) forState:UIControlStateNormal];
    [btn3 setBorder:1 withColor:RGBACOLOR(121, 121, 121, 1)];
    [btn3 addTarget:self action:@selector(showToastCenter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

- (void)showToastBottom{
//    [self.view makeToast:@"测试toast" duration:0.8 position:ToastPositionBOTTOM];
    [self.view makeToast:@"bottom" duration:0.8 position:SHOW_BOTTOM];
}

- (void)showToastCenter{
    [SSXShortCut isShapedScreen];
//    [self.view makeToast:@"测试toast" duration:0.8 position:ToastPositionCENTER];
    [self.view makeToast:@"测试center" duration:0.8 position:SHOW_CENTER];
}

- (void)showToastTop{
//    [self.view makeToast:@"测试toast" duration:0.8 position:ToastPositionTOP];
    [self.view makeToast:@"测试顶部top" duration:0.8 position:SHOW_TOP];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
