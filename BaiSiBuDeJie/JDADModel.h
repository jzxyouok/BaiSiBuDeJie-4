//
//  JDADModel.h
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/20.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDADModel : NSObject

// 广告地址：
@property (nonatomic, copy) NSString *w_picurl;
// 点击广告跳转界面：
@property (nonatomic, copy) NSString *ori_curl;

@property (nonatomic, assign) CGFloat h;
@property (nonatomic, assign) CGFloat w;

@end
