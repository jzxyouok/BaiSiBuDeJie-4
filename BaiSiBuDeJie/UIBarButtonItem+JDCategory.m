
//
//  UIBarButtonItem+JDCategory.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/19.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "UIBarButtonItem+JDCategory.h"

@implementation UIBarButtonItem (JDCategory)

+(UIBarButtonItem *)createBarButtonItemWithNormalImageName:(NSString *)norImgName andHighlightedImageName:(NSString *)highImgName andClickState:(UIControlState)state andTarget:(id)target andSEL:(SEL)selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:norImgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImgName] forState:state];
    [btn sizeToFit];
    // 为按钮包装一个UIView，这样做是为了保持按钮图片原始大小。
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

+(UIBarButtonItem *)setBackBarButtonItemTypeWithTarget:(id)target andSEL:(SEL)selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    // 按钮向左移动：
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [btn sizeToFit];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

@end
