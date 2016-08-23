//
//  ChannalViewController.h
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannalViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    __weak IBOutlet UITableView *_tableView;
    NSArray     *_nameArray;
    NSArray     *_detailArray;
    
}

@end
