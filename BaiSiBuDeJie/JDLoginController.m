//
//  JDLoginController.m
//  百思不得姐
//
//  Created by JiangDi on 16/6/2.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "JDLoginController.h"

@interface JDLoginController ()

// 登录按钮：
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
// 登录view左边的约束；
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeading;
// 注册按钮：
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation JDLoginController

// 修改状态栏样式：
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLoginController];
}

/**
 *  初始化：
 */
-(void)setupLoginController {
    // 按钮圆角：
    self.registerButton.layer.cornerRadius = 5;
    self.registerButton.layer.masksToBounds = YES;
    // KVC方式设置：
    [self.loginButton setValue:@5 forKeyPath:@"layer.cornerRadius"];
    [self.loginButton setValue:@YES forKeyPath:@"layer.masksToBounds"];
}

// 点击关闭当前界面：
- (IBAction)clickToCloseThisPage:(UIButton *)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 点击切换到注册界面：
- (IBAction)clickToShowRegisterViewOrLoginView:(UIButton *)sender {
    JDFunc;
    // 退出键盘：
    [self.view endEditing:YES];
    // 判断当前是在哪个界面：
    if (self.loginViewLeading.constant) {
        self.loginViewLeading.constant = 0;
        [sender setTitle:@"没有帐号？点击注册" forState:UIControlStateNormal];
    } else {
        self.loginViewLeading.constant = -self.view.jd_width;
        [sender setTitle:@"已有帐号？点击登录" forState:UIControlStateNormal];
    }
    // 动画刷新：
    [UIView animateWithDuration:0.8f animations:^{
        // 强制刷新：
        [self.view layoutIfNeeded];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
