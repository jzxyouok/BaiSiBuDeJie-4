//
//  JDFriendTrendController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDFriendTrendController.h"
#import "JDLoginController.h"

@interface JDFriendTrendController ()

@end

@implementation JDFriendTrendController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFriendTrendController];
}

-(void)setupFriendTrendController {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem createBarButtonItemWithNormalImageName:@"friendsRecommentIcon" andHighlightedImageName:@"friendsRecommentIcon-click" andClickState:UIControlStateHighlighted andTarget:self andSEL:@selector(clickToIntoFriendTrendPage:)];
}

-(void)clickToIntoFriendTrendPage:(UIButton *)sender {
    JDFunc;
}

// 点击进入登录界面：
- (IBAction)clickToIntoLoginPage:(UIButton *)sender {
    JDFunc;
    JDLoginController *loginVc = [[JDLoginController alloc] init];
    [self presentViewController:loginVc animated:YES completion:nil];
}

@end
