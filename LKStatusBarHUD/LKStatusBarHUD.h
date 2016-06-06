//
//  LKStatusBarHUD.h
//  状态栏指示器
//
//  Created by Kai Liu on 16/6/6.
//  Copyright © 2016年 Kai Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKStatusBarHUD : NSObject

/**
 *  显示自定信息
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;

@end
