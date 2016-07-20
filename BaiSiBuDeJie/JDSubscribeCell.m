//
//  JDSubscribeCell.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/20.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDSubscribeCell.h"
#import "JDSubscribeModel.h"
#import <UIImageView+WebCache.h>

@interface JDSubscribeCell ()

// 头像：
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
// 名字：
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
// 订阅数辆：
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation JDSubscribeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // 图标圆形处理：
    self.iconImageView.layer.cornerRadius = 25;
    self.iconImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+(JDSubscribeCell *)loadFromXibWithTableView:(UITableView *)tableView {
    static NSString *reuseID = @"Subscribe";
    JDSubscribeCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JDSubscribeCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setSubscribe:(JDSubscribeModel *)subscribe {
    _subscribe = subscribe;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:subscribe.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 裁剪图片：
        /**
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [path addClip];
        [image drawAtPoint:CGPointZero];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext(); */
        self.iconImageView.image = image;
    }];
    
    self.nameLabel.text = subscribe.theme_name;
    // 数字处理：
    NSInteger count = [subscribe.sub_number integerValue];
    NSString *countStr = @"";
    if (count > 10000) {
        countStr = [NSString stringWithFormat:@"已有%.1lf万人订阅", count / 10000.0];
        countStr = [countStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    } else {
        countStr = [NSString stringWithFormat:@"已有%zd人订阅", count];
    }
    self.countLabel.text = countStr;
}

// 点击订阅：
- (IBAction)clickToSubscribe:(UIButton *)sender {
    JDFunc;
}

@end
