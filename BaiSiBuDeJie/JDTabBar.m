//
//  JDTabBar.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDTabBar.h"

/**
 [xxx appearance] 表示拿到app中所有的xxx对象：
 只有遵守了UIAppearance协议的类才能调用Appearance方法；
 只有被UI_APPEARANCE_SELECTOR宏修饰的属性才能设置。
 */

// tabBar子控件总数：
#define subviewsCount (self.items.count + 1)

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
    [self setTintColor:[UIColor blackColor]];
}

// 添加发布按钮：
-(void)addPublishButton {
    UIButton *publishBtn = [[UIButton alloc] init];
    [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    [self addSubview:publishBtn];
    self.publishBtn = publishBtn;
    
    [publishBtn addTarget:self action:@selector(clickToPublishNewTopic:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  点击发布新贴：
 *
 *  @param publishBtn
 */
-(void)clickToPublishNewTopic:(UIButton *)publishBtn {
    // 执行代理：
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBar:publishBtnDidClick:)]) {
        [self.tabBarDelegate tabBar:self publishBtnDidClick:publishBtn];
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    // 此处打印出的subview的个数为7而不是5，说明部分控件并不是可见的。
//    JDLog(@"%zd", self.subviews.count);

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
