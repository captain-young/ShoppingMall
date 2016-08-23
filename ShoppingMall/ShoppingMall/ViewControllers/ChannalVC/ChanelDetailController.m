//
//  ChanelDetailController.m
//  ShoppingMall
//
//  Created by white on 16/1/3.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "ChanelDetailController.h"

@interface ChanelDetailController ()<UIAlertViewDelegate>
{
    HomePageViewModel *_homeVM;
    NSArray     *_backUpArray;
}
@end

@implementation ChanelDetailController

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
        _backUpArray = returnValue;
        [SVProgressHUD dismiss];
        [weakTableView reloadData];
        [weakTableView.header endRefreshing];
        
    } WithErrorBlock:^(id errorCode) {
        
    } WithFailureBlock:^{
        
    }];
     NSArray * array = @[@28,@26,@23,@24,@27,@37,@29,@40];
    NSString *string = [NSString stringWithFormat:@"http://app.gouwubang.com/visit!productlist.do?channel=%zd&maxPrice=&minPrice=&name=&orderbyColumn=weight&orderbyType=desc&pno=0&productSource=&psize=20",[array[_num] integerValue]];
    [_homeVM dealWithProductData:string];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
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
- (IBAction)defultSort:(id)sender {
    
    _dataArray = _backUpArray;
    [self reloadData];
    
}

- (IBAction)priceUp:(id)sender {
    
    [self sortData:YES];
    
    
}
- (IBAction)priceDown:(id)sender {
    
    [self sortData:NO];
    
}


- (IBAction)filterProduct:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"筛选" message:nil delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    UITextField *priceUp = (UITextField *)[alert textFieldAtIndex:0];
    UITextField *priceDown = (UITextField *)[alert textFieldAtIndex:1];
    priceUp.placeholder = @"最低价格";
    priceDown.placeholder = @"最高价格";
    priceDown.secureTextEntry = NO;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UITextField *priceUp = (UITextField *)[alertView textFieldAtIndex:0];
        UITextField *priceDown = (UITextField *)[alertView textFieldAtIndex:1];
        NSPredicate *pridicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"self.rebatePrice BETWEEN {%f,%f}",[priceUp.text floatValue],[priceDown.text floatValue]]];
        _dataArray = [_backUpArray filteredArrayUsingPredicate:pridicate];
        [self reloadData];
        
    }
}

- (void)sortData:(BOOL)ascending
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"rebatePrice" ascending:ascending];
    _dataArray = [_dataArray sortedArrayUsingDescriptors:@[sort]];
    [self reloadData];
}

- (void)reloadData;
{
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:0];
    [_tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
}

@end
