//
//  JDMeController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDMeController.h"
#import "JDSettingController.h"

@interface JDMeController ()

@end

@implementation JDMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMeController];
}

-(void)setupMeController {
    UIBarButtonItem *moonItem = [UIBarButtonItem createBarButtonItemWithNormalImageName:@"mine-moon-icon" andHighlightedImageName:@"mine-sun-icon-click" andClickState:UIControlStateSelected andTarget:self andSEL:@selector(clickToIntoNightModel:)];
    UIBarButtonItem *settingItem = [UIBarButtonItem createBarButtonItemWithNormalImageName:@"mine-setting-icon" andHighlightedImageName:@"mine-setting-icon-click" andClickState:UIControlStateHighlighted andTarget:self andSEL:@selector(clickToIntoSettingPage:)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem,];
}

-(void)clickToIntoNightModel:(UIButton *)sender {
    JDFunc;
    sender.selected = !sender.selected;
}

// 点击进入设置界面：
-(void)clickToIntoSettingPage:(UIButton *)sender {
    JDFunc;
    JDSettingController *settingVc = [[JDSettingController alloc] init];
    [self.navigationController pushViewController:settingVc animated:YES];
}

@end
