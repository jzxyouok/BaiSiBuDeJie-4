
//
//  UIBarButtonItem+JDCategory.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/19.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "UIBarButtonItem+JDCategory.h"

@implementation UIBarButtonItem (JDCategory)

+(UIBarButtonItem *)createBarButtonItemWithNormalImageName:(NSString *)norImgName andHighlightedImageName:(NSString *)highImgName andTarget:(id)target andSEL:(SEL)selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:norImgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImgName] forState:UIControlStateHighlighted];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
