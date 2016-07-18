//
//  UIBarButtonItem+JDCategory.h
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/19.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JDCategory)

+(UIBarButtonItem *)createBarButtonItemWithNormalImageName:(NSString *)norImgName andHighlightedImageName:(NSString *)highImgName andTarget:(id)target andSEL:(SEL)selector;

@end
