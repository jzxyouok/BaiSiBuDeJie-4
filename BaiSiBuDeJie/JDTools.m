//
//  JDTools.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/19.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDTools.h"

static JDTools *_instance;

@implementation JDTools

+(instancetype)shardTools {
    return [[self alloc] init];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

-(instancetype)copyWithZone:(struct _NSZone *)zone {
    return _instance;
}

-(instancetype)mutableCopyWithZone:(struct _NSZone *)zone {
    return _instance;
}

+(UIImageView *)getMainTitleView {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

@end
