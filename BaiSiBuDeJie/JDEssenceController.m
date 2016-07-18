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
    self.navigationItem.titleView = [[JDTools shardTools] getMainTitleView];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem createBarButtonItemWithNormalImageName:@"" andHighlightedImageName:@"" andTarget:self andSEL:@selector(clickToIntoGamesPage:)];
}

-(void)clickToIntoGamesPage:(UIButton *)sender {
    JDFunc;
}

@end
