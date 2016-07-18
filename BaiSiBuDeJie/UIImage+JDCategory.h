//
//  UIImage+JDCategory.h
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JDCategory)

/**
 *  返回原始(不被渲染)的图片：
 *
 *  @param imgName 图片名。
 *
 *  @return 
 */
+(UIImage *)getOriginalImageWithName:(NSString *)imgName;

@end
