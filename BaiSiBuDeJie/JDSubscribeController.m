//
//  JDSubscribeController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/20.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDSubscribeController.h"
#import <AFNetworking.h>
#import "JDSubscribeModel.h"
#import <MJExtension.h>
#import "JDSubscribeCell.h"
#import <SVProgressHUD.h>

@interface JDSubscribeController ()

// 订阅模型数组：
@property (nonatomic, strong) NSMutableArray *subsArray;
// 网络管理者：
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation JDSubscribeController

-(NSMutableArray *)subsArray {
    if (nil == _subsArray) {
        _subsArray = [NSMutableArray array];
    }
    return _subsArray;
}

-(void)viewWillDisappear:(BOOL)animated {
    JDFunc;
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
    // 取消所有网络任务：
    [self.manager.tasks makeObjectsPerformSelector:@selector(removeAllObjects)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubscribeController];
}

-(void)setupSubscribeController {
    self.navigationItem.title = @"订阅";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self loadData];
}

-(void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    self.manager = manager;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"c"] = @"topic";
    parameters[@"action"] = @"sub";
    
    [SVProgressHUD show];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//        [responseObject writeToFile:@"/Users/Jiang/Desktop/Demo/tag.plist" atomically:YES];
        // 字典转模型：
        self.subsArray = [JDSubscribeModel mj_objectArrayWithKeyValuesArray:responseObject];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error.... %@", error);
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDSubscribeCell *cell = [JDSubscribeCell loadFromXibWithTableView:tableView];
    JDSubscribeModel *sub = self.subsArray[indexPath.row];
    cell.subscribe = sub;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

@end
