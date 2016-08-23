//
//  WebController.h
//  ShoppingMall
//
//  Created by white on 16/1/3.
//  Copyright © 2016年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebController : UIViewController

@property (nonatomic,copy)NSString *name;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
