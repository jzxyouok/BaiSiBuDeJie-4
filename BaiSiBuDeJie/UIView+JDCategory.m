//
//  UIView+JDCategory.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "UIView+JDCategory.h"

@implementation UIView (JDCategory)

-(void)setJd_x:(CGFloat)jd_x {
    CGRect frame = self.frame;
    frame.origin.x = jd_x;
    self.frame = frame;
}

-(CGFloat)jd_x {
    return self.frame.origin.x;
}

-(void)setJd_y:(CGFloat)jd_y {
    CGRect frame = self.frame;
    frame.origin.y = jd_y;
    self.frame = frame;
}

-(CGFloat)jd_y {
    return self.frame.origin.y;
}

-(void)setJd_width:(CGFloat)jd_width {
    CGRect frame = self.frame;
    frame.size.width = jd_width;
    self.frame = frame;
}

-(CGFloat)jd_width {
    return self.frame.size.width;
}

-(void)setJd_height:(CGFloat)jd_height {
    CGRect frame = self.frame;
    frame.size.height = jd_height;
    self.frame = frame;
}

-(CGFloat)jd_height {
    return self.frame.size.height;
}

-(void)setJd_size:(CGSize)jd_size {
    CGRect frame = self.frame;
    frame.size = jd_size;
    self.frame = frame;
}

-(CGSize)jd_size {
    return self.frame.size;
}

-(void)setJd_centerX:(CGFloat)jd_centerX {
    CGPoint center = self.center;
    center.x = jd_centerX;
    self.center = center;
}

-(CGFloat)jd_centerX {
    return self.center.x;
}

-(void)setJd_centerY:(CGFloat)jd_centerY {
    CGPoint center = self.center;
    center.y = jd_centerY;
    self.center = center;
}

-(CGFloat)jd_centerY {
    return self.center.y;
}

-(CGFloat)jd_right {
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)jd_bootom {
    return CGRectGetMaxY(self.frame);
}

+(instancetype)jd_viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
