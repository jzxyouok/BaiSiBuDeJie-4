//
//  JDSubscribeCell.h
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/20.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDSubscribeModel;

@interface JDSubscribeCell : UITableViewCell

// 数据模型：
@property (nonatomic, strong) JDSubscribeModel *subscribe;

+(JDSubscribeCell *)loadFromXibWithTableView:(UITableView *)tableView;

@end
