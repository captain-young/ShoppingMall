//
//  HomePageController.m
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "HomePageController.h"
#import "FunctionCell.h"
#import "PublicCell.h"
@interface HomePageController ()
{
    HomePageViewModel *_homeVM;
}
@end
static NSInteger pno = 0;
@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [SVProgressHUD showWithStatus:@"正在加载"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    
    [HomePageViewModel changeNavgationStyle:self.navigationController];
    
    _homeVM = [[HomePageViewModel alloc] init];
    __weak UITableView *weakTableView = _tableView;
    [_homeVM setBlockWithReturnBlock:^(id returnValue) {
        _dataArray = returnValue;
        [SVProgressHUD dismiss];
        [weakTableView reloadData];
        [weakTableView.header endRefreshing];
        
        } WithErrorBlock:^(id errorCode) {
                       
        } WithFailureBlock:^{
        
    }];
    
    [_homeVM dealWithProductData:URL_HOMEPAGE(0)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_homeVM refreshData:_tableView url:URL_HOMEPAGE(0)];
    [_homeVM infinityData:_tableView url:URL_HOMEPAGE(pno++) success:^(id loadValue) {
        [_dataArray addObjectsFromArray:(NSArray *)loadValue];
        [_tableView reloadData];
        [_tableView.footer endRefreshing];
    }];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return  _dataArray.count;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PublicCell *pcell = [tableView dequeueReusableCellWithIdentifier:@"public" forIndexPath:indexPath];
    [HomePageViewModel fetchDataWithCell:pcell data:_dataArray indexPath:indexPath];
    return pcell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    return  100.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductModel *models = [_dataArray objectAtIndex:indexPath.row];
    [_homeVM gotoWebVC:models.name nav:self.navigationController];
}


@end
