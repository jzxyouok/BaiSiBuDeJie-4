//
//  UITextField+JDCategory.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/21.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "UITextField+JDCategory.h"

// Placeholder颜色的keyPath：
static NSString * const TextFieldPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (JDCategory)

#warning 分类中的属性是不会自动生成getter和setter方法的，所以在任何情况下，都必须对其进行重写。

-(void)setPlaceholderColor:(UIColor *)placeholderColor {
    [self setValue:placeholderColor forKeyPath:TextFieldPlaceholderColorKey];
}

-(UIColor *)placeholderColor {
    return [self valueForKeyPath:TextFieldPlaceholderColorKey];
}

@end
