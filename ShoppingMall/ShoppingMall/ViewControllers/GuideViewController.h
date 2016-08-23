//
//  GuideViewController.h
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController<UIScrollViewDelegate>{
    
    __weak IBOutlet UIScrollView *_scrollView;
    __weak IBOutlet UIPageControl *_pageControll;
    UIView  *_contentView;

    
}

@end
