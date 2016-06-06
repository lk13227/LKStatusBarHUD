//
//  LKStatusBarHUD.m
//  状态栏指示器
//
//  Created by Kai Liu on 16/6/6.
//  Copyright © 2016年 Kai Liu. All rights reserved.
//

#import "LKStatusBarHUD.h"


#define LKHUDFONT [UIFont systemFontOfSize:12]
static CGFloat const LKHUDDuration = 2.0;
static CGFloat const LKAnimationDuration = 0.25;

@implementation LKStatusBarHUD

static UIWindow *window_;

static NSTimer *timer_;

+ (void)setuoWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;//设置window的优先度
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:LKAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示自定信息
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    
    [self setuoWindow];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = LKHUDFONT;
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:LKHUDDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

/**
 *  显示信息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"LKStatusBarHUD.bundle/勾"]];
}

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"LKStatusBarHUD.bundle/叉叉"]];
}

/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self setuoWindow];
    
    //添加文字
    UILabel *label = [[UILabel alloc] init];
    label.frame = window_.bounds;
    label.text = msg;
    label.font = LKHUDFONT;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //算出文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : LKHUDFONT}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [loadingView startAnimating];
    [window_ addSubview:loadingView];
    
}

/**
 *  隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:LKAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
