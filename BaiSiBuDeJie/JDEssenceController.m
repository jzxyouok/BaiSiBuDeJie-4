//
//  JDEssenceController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDEssenceController.h"

@interface JDEssenceController ()

@end

@implementation JDEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupEssenceController];
}

-(void)setupEssenceController {
    self.navigationItem.titleView = [JDTools getMainTitleView];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem createBarButtonItemWithNormalImageName:@"nav_item_game_icon" andHighlightedImageName:@"nav_item_game_click_icon" andClickState:UIControlStateHighlighted andTarget:self andSEL:@selector(clickToIntoGamesPage:)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem createBarButtonItemWithNormalImageName:@"navigationButtonRandom" andHighlightedImageName:@"navigationButtonRandomClick" andClickState:UIControlStateHighlighted andTarget:self andSEL:@selector(clickToGetRandomResult:)];
}

-(void)clickToIntoGamesPage:(UIButton *)sender {
    JDFunc;
}

-(void)clickToGetRandomResult:(UIButton *)sender {
    JDFunc;
}

@end
