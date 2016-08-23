//
//  HomePageViewModel.h
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "ViewModelClass.h"
#import "PublicCell.h"
@interface HomePageViewModel : ViewModelClass

- (void)dealWithProductData:(NSString *)urlStr;

+ (void)fetchDataWithCell:(PublicCell *)cell
                     data:(NSArray *)data
                indexPath:(NSIndexPath *)indextPath;

- (void)refreshData:(UITableView *)tableView
                url:(NSString *)url;

- (void)infinityData:(UITableView *)tableView
                 url:(NSString *)url
             success:(SuccessBlock)block;

+ (NSMutableArray *)sortProductPrice : (NSArray *)array
                              accend : (BOOL)accending ;

@end
