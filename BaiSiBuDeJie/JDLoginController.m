//
//  JDLoginController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/20.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDLoginController.h"

@interface JDLoginController ()

@property (weak, nonatomic) IBOutlet UIView *loginRegisterView;

@end

@implementation JDLoginController

// 状态栏样式：
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLoginController];
}

-(void)setupLoginController {

}

// 点击关闭登录界面：
- (IBAction)clickToCloseLoginPage:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 点击选择登录/注册页面：
- (IBAction)clickToSwitchLoginOrRegister:(UIButton *)sender {
    JDFunc;
}

@end
