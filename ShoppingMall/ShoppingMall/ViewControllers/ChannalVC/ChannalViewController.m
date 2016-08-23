//
//  ChannalViewController.m
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "ChannalViewController.h"
#import "ChanelDetailController.h"
@interface ChannalViewController ()

@end

@implementation ChannalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [HomePageViewModel changeNavgationStyle:self.navigationController];
    _nameArray = @[@"女装",@"男装",@"家居",@"鞋包",@"数码",@"母婴",@"美妆",@"食品"];
    _detailArray = @[@"女士服装 内衣",@"男士服装 夹克",@"家纺 家装",@"鞋 箱包皮具",@"数码电脑 家用电器",@"童装 孕妇装",@"美妆日化",@"零食 特产"];
    _tableView.dataSource = self;
    _tableView.delegate  = self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _nameArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
    }
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon-%zd-1",indexPath.section+1]];
    cell.textLabel.text = _nameArray[indexPath.section];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    cell.detailTextLabel.text = _detailArray[indexPath.section];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:16];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChanelDetailController *detailVC  = [MAINSB instantiateViewControllerWithIdentifier:@"detail"];
    detailVC.num = indexPath.section;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
