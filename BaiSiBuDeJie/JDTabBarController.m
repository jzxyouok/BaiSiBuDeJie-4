//
//  JDTabBarController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDTabBarController.h"
#import "JDNavigationController.h"
#import "JDEssenceController.h"
#import "JDNewController.h"
#import "JDMeController.h"
#import "JDFriendTrendController.h"
#import "JDTabBar.h"

@interface JDTabBarController ()

@end

@implementation JDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarController];
}

-(void)setupTabBarController {
    [self addChildViewControllers];
    // 替换系统tabBar：
    JDTabBar *tabBar = [[JDTabBar alloc] init];
    [tabBar setTintColor:[UIColor blackColor]];
    [self setValue:tabBar forKey:@"tabBar"];
}

/**
 *  添加所有子控制器：
 */
-(void)addChildViewControllers {
    // 精华：
    JDEssenceController *essenceVc = [[JDEssenceController alloc] init];
    [self createChildViewController:essenceVc withTitle:@"精华" andNormalImageName:@"tabBar_essence_icon" andSelectedImageName:@"tabBar_essence_click_icon"];
    // 新帖：
    JDNewController *newVc = [[JDNewController alloc] init];
    [self createChildViewController:newVc withTitle:@"新帖" andNormalImageName:@"tabBar_new_icon" andSelectedImageName:@"tabBar_new_click_icon"];
    // 关注：
    JDFriendTrendController *ftVc = [[JDFriendTrendController alloc] init];
    [self createChildViewController:ftVc withTitle:@"关注" andNormalImageName:@"tabBar_friendTrends_icon" andSelectedImageName:@"tabBar_friendTrends_click_icon"];
    // 我：
    JDMeController *meVc = [[JDMeController alloc] init];
    [self createChildViewController:meVc withTitle:@"我" andNormalImageName:@"tabBar_me_icon" andSelectedImageName:@"tabBar_me_click_icon"];
}

/**
 *  创建子控制器的方法：
 *
 *  @param vc         空白控制器；
 *  @param name       名称；
 *  @param norImgName 普通图；
 *  @param selImgName 选中图。
 */
-(void)createChildViewController:(UIViewController *)vc withTitle:(NSString *)title andNormalImageName:(NSString *)norImgName andSelectedImageName:(NSString *)selImgName {
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:norImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    JDNavigationController *navVc = [[JDNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
}

@end
