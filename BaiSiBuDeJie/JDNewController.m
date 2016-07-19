//
//  JDNewController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDNewController.h"

@interface JDNewController ()

@end

@implementation JDNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNewController];
}

-(void)setupNewController {
    self.navigationItem.titleView = [[JDTools shardTools] getMainTitleView];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem createBarButtonItemWithNormalImageName:@"MainTagSubIcon" andHighlightedImageName:@"MainTagSubIconClick" andClickState:UIControlStateHighlighted andTarget:self andSEL:@selector(clickToIntoSubscribePage:)];
}

// 点击进入订阅页面：
-(void)clickToIntoSubscribePage:(UIButton *)sender {
    JDFunc;
}

@end
