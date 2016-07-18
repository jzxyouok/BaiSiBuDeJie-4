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
}

@end
