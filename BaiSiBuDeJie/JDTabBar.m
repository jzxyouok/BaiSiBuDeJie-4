//
//  JDTabBar.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDTabBar.h"

// tabBar子控件总数：
#define subviewsCount 5.0

@interface JDTabBar ()

// 发布按钮：
@property (nonatomic, weak) UIButton *publishBtn;

@end

@implementation JDTabBar

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupTabBar];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupTabBar];
    }
    return self;
}

-(void)setupTabBar {
    [self addPublishButton];
    [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}

-(void)addPublishButton {
    UIButton *publishBtn = [[UIButton alloc] init];
    [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    [self addSubview:publishBtn];
    self.publishBtn = publishBtn;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    // 重新布局子控件：
    NSInteger index = 0;
    CGFloat x = 0;
    CGFloat width = self.jd_width / subviewsCount;
    for (UIView *subview in self.subviews) {
        if (subview.class == NSClassFromString(@"UITabBarButton")) {
            x = index * width;
            subview.jd_x = x;
            // 空出中间的位置：
            if (index == 1) {
                index++;
            }
            index++;
        }
    }
    // 发布按钮布局：
    [self.publishBtn sizeToFit];
    self.publishBtn.jd_x = (self.jd_width - self.publishBtn.jd_width) * 0.5;
    self.publishBtn.jd_y = (self.jd_height - self.publishBtn.jd_height) * 0.5;
}

@end
