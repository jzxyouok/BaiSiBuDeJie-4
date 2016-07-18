//
//  JDTabBar.h
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDTabBar;

@protocol JDTabBarDelegate <NSObject>

/**
 *  发布按钮点击代理：
 *
 *  @param tabBar
 *  @param publishBtn 
 */
-(void)tabBar:(JDTabBar *)tabBar publishBtnDidClick:(UIButton *)publishBtn;

@end

@interface JDTabBar : UITabBar

@property (nonatomic, weak) id<JDTabBarDelegate> tabBarDelegate;

@end
