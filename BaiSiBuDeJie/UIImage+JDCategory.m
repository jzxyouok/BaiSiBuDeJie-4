//
//  UIImage+JDCategory.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "UIImage+JDCategory.h"

@implementation UIImage (JDCategory)

+(UIImage *)getOriginalImageWithName:(NSString *)imgName {
    return [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
