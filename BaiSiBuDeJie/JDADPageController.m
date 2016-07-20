//
//  JDADPageController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/19.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDADPageController.h"


@interface JDADPageController ()

// 启动图片：
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;


@end

@implementation JDADPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupADPageController];
}

-(void)setupADPageController {
    // 设置启动图片：
    UIImage *image = nil;
    if (iPhone6P) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iPhone6) {
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) {
        image = [UIImage imageNamed:@"LaunchImage-568h"];
    } else if (iPhone4) {
        image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    self.launchImageView.image = image;
}

// 点击跳过
- (IBAction)clickToSkipADPage:(UIButton *)sender {
    JDFunc;
}

@end
