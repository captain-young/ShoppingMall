//
//  WebController.m
//  ShoppingMall
//
//  Created by white on 16/1/3.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "WebController.h"

@interface WebController ()

@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * string = [[NSString stringWithFormat:@"http://s8.m.taobao.com/munion/search.htm?q=%@&pid=mm_47222882_7900042_26866721&tab=mall&taoke_type=1",_name] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",string);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    [_webView loadRequest:request];
}


@end
