//
//  MoreTableViewController.m
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "MoreTableViewController.h"

@interface MoreTableViewController ()
{
    NSArray *_dataArr;
}
@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [HomePageViewModel changeNavgationStyle:self.navigationController];
    _dataArr = @[@"检查更新",@"我要吐槽",@"关于我们"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreCell" forIndexPath:indexPath];
    cell.textLabel.text = _dataArr[indexPath.row];
    
    return cell;
}



@end
