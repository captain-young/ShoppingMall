//
//  HomePageController.h
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *_dataArray;
    __weak IBOutlet UITableView *_tableView;
}

@end
