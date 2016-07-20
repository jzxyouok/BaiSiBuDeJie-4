//
//  JDADPageController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/19.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDADPageController.h"
#import "JDADModel.h"
#import "JDTabBarController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>

#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface JDADPageController ()

// 启动图片：
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
// 展示广告：
@property (nonatomic, strong) UIImageView *adImageView;
// 广告占位：
@property (weak, nonatomic) IBOutlet UIView *adContainView;
// 广告模型：
@property (nonatomic, strong) JDADModel *ad;
// 跳过广告按钮：
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
// 定时器：
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation JDADPageController

-(UIImageView *)adImageView {
    if (nil == _adImageView) {
        _adImageView = [[UIImageView alloc] init];
        [self.adContainView addSubview:_adImageView];
        // 为adImageView添加点击手势：
        UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToOpenSafariWithADPage)];
        [_adImageView addGestureRecognizer:tapGr];
        // 打开交互：
        [_adImageView setUserInteractionEnabled:YES];
    }
    return _adImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupADPageController];
}

-(void)setupADPageController {
    // 设置启动图片：
    UIImage *image = nil;
    if (iPhone6P) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iPhone6) {
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) {
        image = [UIImage imageNamed:@"LaunchImage-568h"];
    } else if (iPhone4) {
        image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    self.launchImageView.image = image;
    // 加载广告数据：
    [self loadADPageData];
    // 创建定时器：
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    self.timer = timer;
}

// 倒计时：
-(void)countDown {
    static NSInteger secondCount = 5;
    if (secondCount == 1) {
        [self clickToSkipADPage:nil];
    }
    secondCount--;
    [self.skipButton setTitle:[NSString stringWithFormat:@"跳过 (%zd)", secondCount] forState:UIControlStateNormal];
}

// 加载广告界面数据：
-(void)loadADPageData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置相应头解析格式：
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    
    [manager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        JDLog(@"%@", responseObject);
//        [responseObject writeToFile:@"/Users/Jiang/Desktop/Demo/data.plist" atomically:YES];
        // 取出对应字典：
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        // 字典转模型：
        JDADModel *ad = [JDADModel mj_objectWithKeyValues:adDict];
//        JDLog(@"%@", ad);
        // 计算广告图片大小：
        CGFloat width = JDScreenWidth;
        CGFloat height = JDScreenWidth / ad.w * ad.h;
        CGFloat x = 0;
        CGFloat y = 0;
        self.adImageView.frame = CGRectMake(x, y, width, height);
        // 加载网络数据：
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:ad.w_picurl]];
        self.ad = ad;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JDLog(@"error....%@", error);
    }];
}

// 点击打开浏览器：
-(void)tapToOpenSafariWithADPage {
    UIApplication *app = [UIApplication sharedApplication];
    if (![app canOpenURL:[NSURL URLWithString:self.ad.ori_curl]]) {
        [SVProgressHUD showErrorWithStatus:@"出错了X..."];
        return;
    }
    [app openURL:[NSURL URLWithString:self.ad.ori_curl]];
}

// 点击跳过
- (IBAction)clickToSkipADPage:(UIButton *)sender {
    JDFunc;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    JDTabBarController *tabBarVc = [[JDTabBarController alloc] init];
    window.rootViewController = tabBarVc;
    // 销毁定时器：
#warning 定时器必须手动销毁，否则会引起BUG。
    [self.timer invalidate];
}

@end
