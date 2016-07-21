
//
//  JDTPButton.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/21.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDTPButton.h"

#define margin 5

@implementation JDTPButton

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
