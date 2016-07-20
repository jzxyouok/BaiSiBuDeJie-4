//
//  UIView+JDCategory.h
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JDCategory)

@property (nonatomic, assign) CGFloat jd_x;
@property (nonatomic, assign) CGFloat jd_y;
@property (nonatomic, assign) CGFloat jd_width;
@property (nonatomic, assign) CGFloat jd_height;
@property (nonatomic, assign) CGSize jd_size;
@property (nonatomic, assign) CGFloat jd_centerX;
@property (nonatomic, assign) CGFloat jd_centerY;

@property (nonatomic, assign, readonly) CGFloat jd_right;
@property (nonatomic, assign, readonly) CGFloat jd_bootom;

+(instancetype)jd_viewFromXib;

@end
