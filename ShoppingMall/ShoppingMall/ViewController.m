//
//  ViewController.m
//  ShoppingMall
//
//  Created by white on 15/12/29.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "ViewController.h"
#import "HomePageViewModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    HomePageViewModel *homeVM = [[HomePageViewModel alloc] init];
    
    if ([homeVM isFirstLogin])
    {
        [homeVM gotoGuideVC];
    }
    else
    {
        [homeVM gotoHomePageVC];
    }
  
}




@end
