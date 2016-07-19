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

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
