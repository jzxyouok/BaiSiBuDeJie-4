//
//  UIBarButtonItem+JDCategory.h
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/19.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JDCategory)

/**
 *  创建自定义UIBarButtonItem：
 *
 *  @param norImgName  普通图；
 *  @param highImgName 高亮/选中图
 *  @param state       按钮点击状态；
 *  @param target
 *  @param selector
 *
 *  @return 
 */
+(UIBarButtonItem *)createBarButtonItemWithNormalImageName:(NSString *)norImgName andHighlightedImageName:(NSString *)highImgName andClickState:(UIControlState)state andTarget:(id)target andSEL:(SEL)selector;

/**
 *  设置导航条返回按钮样式：
 *
 *  @param target
 *  @param selector
 *
 *  @return
 */
+(UIBarButtonItem *)setBackBarButtonItemTypeWithTarget:(id)target andSEL:(SEL)selector;

@end
