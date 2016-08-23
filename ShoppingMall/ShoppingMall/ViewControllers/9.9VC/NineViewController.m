
//
//  NineViewController.m
//  ShoppingMall
//
//  Created by white on 15/12/31.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "NineViewController.h"
#import "PublicCell.h"
@interface NineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray     *_dataArray;
}
@end
static NSInteger pno = 0;
@implementation NineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [HomePageViewModel changeNavgationStyle:self.navigationController];
    HomePageViewModel *homeVM = [[HomePageViewModel alloc] init];
    [SVProgressHUD showWithStatus:@"正在加载"];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [homeVM setBlockWithReturnBlock:^(id returnValue) {
        _dataArray = returnValue;
        [SVProgressHUD dismiss];
        [_tableView reloadData];
        [_tableView.header endRefreshing];
        
    } WithErrorBlock:^(id errorCode) {
        
    } WithFailureBlock:^{
        
    }];
    [homeVM dealWithProductData:URL_NINE(0)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
   
    [homeVM refreshData:_tableView url:URL_NINE(0)];
    [homeVM infinityData:_tableView url:URL_NINE(pno++) success:^(id loadValue){
        [_dataArray addObjectsFromArray:(NSArray *)loadValue];
        [_tableView reloadData];
        [_tableView.footer endRefreshing];
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"public" forIndexPath:indexPath];
    [HomePageViewModel fetchDataWithCell:cell data:_dataArray indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}





@end
