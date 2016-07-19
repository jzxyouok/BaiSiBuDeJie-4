//
//  JDNavigationController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDNavigationController.h"

@interface JDNavigationController ()

@end

@implementation JDNavigationController

/**
 [xxx appearance] 表示拿到app中所有的xxx对象：
 只有遵守了UIAppearance协议的类才能调用Appearance方法；
 只有被UI_APPEARANCE_SELECTOR宏修饰的属性才能设置。
 */

+(void)initialize {
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [navBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f], NSForegroundColorAttributeName: [UIColor blackColor]}];
}

// 重写push方法，拦截push过程中的一些操作：
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        // 跳转时隐藏TabBar：
        viewController.hidesBottomBarWhenPushed = YES;
        // 统一左上角的返回按钮：
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem setBackBarButtonItemTypeWithTarget:self andSEL:@selector(clickToBack:)];
    }
#warning 必须在最后调用[super push...]方法，否则无法进行push。
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 返回到上一个控制器：
-(void)clickToBack:(UIButton *)sender {
    JDFunc;
    [self popViewControllerAnimated:YES];
}

@end
