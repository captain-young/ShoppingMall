//
//  ChanelDetailController.h
//  ShoppingMall
//
//  Created by white on 16/1/3.
//  Copyright © 2016年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewModel.h"
@interface ChanelDetailController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,retain) NSArray *dataArray;
@property (nonatomic,assign) NSInteger num;
@end
