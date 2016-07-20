//
//  JDSubscribeController.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/20.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDSubscribeController.h"
#import <AFNetworking.h>

@interface JDSubscribeController ()

@end

@implementation JDSubscribeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubscribeController];
}

-(void)setupSubscribeController {
    self.navigationItem.title = @"订阅";
    [self loadData];
}

-(void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"c"] = @"topic";
    parameters[@"action"] = @"sub";
    
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error.... %@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
