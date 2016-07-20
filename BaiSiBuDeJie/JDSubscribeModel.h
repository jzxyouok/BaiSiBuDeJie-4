//
//  JDSubscribeModel.h
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/20.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDSubscribeModel : NSObject

// 头像：
@property (nonatomic, copy) NSString *image_list;
// 订阅数：
@property (nonatomic, copy) NSString *sub_number;
// 用户名：
@property (nonatomic, copy) NSString *theme_name;

@end
