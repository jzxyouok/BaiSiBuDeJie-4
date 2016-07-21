//
//  JDCustomButton.m
//  百思不得姐
//
//  Created by JiangDi on 16/6/2.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "JDCustomButton.h"

#define margin 5

@implementation JDCustomButton

-(void)layoutSubviews {
    [super layoutSubviews];
    // 设置标题的图片的位置：
    self.imageView.jd_centerX = self.jd_width * 0.5;
    self.imageView.jd_y = 0;
    
    self.titleLabel.jd_x = 0;
    self.titleLabel.jd_y = self.imageView.jd_bootom + margin;
    self.titleLabel.jd_width = self.jd_width;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
