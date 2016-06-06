//
//  ViewController.m
//  LKStatusBarHUDExample
//
//  Created by Kai Liu on 16/6/6.
//  Copyright © 2016年 Kai Liu. All rights reserved.
//

#import "ViewController.h"

#import "LKStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)message:(id)sender {
    [LKStatusBarHUD showMessage:@"这是一条信息"];
}

- (IBAction)success:(id)sender {
    [LKStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)error:(id)sender {
    [LKStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(id)sender {
    [LKStatusBarHUD showLoading:@"加载中....."];
}

- (IBAction)hide:(id)sender {
    [LKStatusBarHUD hide];
}

@end
