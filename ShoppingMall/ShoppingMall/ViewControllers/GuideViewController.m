//
//  GuideViewController.m
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contentView = [[UIView alloc] init];
    [_scrollView addSubview:_contentView];
    _scrollView.delegate = self;
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);
        make.height.equalTo(_scrollView.mas_height);
        
    }];
    
   __block UIImageView *nextImg = nil;
    for (int i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"intro%d",i]];
        imageView.userInteractionEnabled = YES;
        [_contentView addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.bottom.offset(0);
            if (i == 0) {
                make.left.offset(0);
            }else{
                make.left.equalTo(nextImg.mas_right).offset(0);
            }
            if (i == 3) {
                make.right.offset(0);
            }
            make.width.equalTo(_scrollView.mas_width);
            nextImg = imageView;
        }];
        if (i == 3) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button addTarget:self action:@selector(gotoNextVC) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.offset(0);
                make.left.offset(0);
                make.right.offset(0);
                make.height.equalTo(imageView.mas_height);
            }];
        }
    }
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(nextImg.mas_right);
    }];
}

- (void)gotoNextVC
{
    HomePageViewModel *homeVM = [[HomePageViewModel alloc] init];
    [homeVM gotoHomePageVC];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControll.currentPage = scrollView.contentOffset.x/SCREEN_W;
}





@end
