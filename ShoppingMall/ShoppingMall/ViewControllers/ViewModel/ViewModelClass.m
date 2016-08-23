//
//  ViewModelClass.m
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "ViewModelClass.h"
#import "GuideViewController.h"
#import "WebController.h"
@implementation ViewModelClass

- (BOOL)isFirstLogin
{
    NSString* lastVersion=[USERDEFULTS objectForKey:VERSION];
    NSString* currentVersion=[NSBundle mainBundle].infoDictionary[VERSION];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        return NO;
    }
    else
    {
        [USERDEFULTS setObject:currentVersion forKey:VERSION];
        [USERDEFULTS synchronize];
        return YES;
    }
}

- (void)gotoGuideVC
{
    
    GuideViewController *guideVC = [MAINSB instantiateViewControllerWithIdentifier:@"guideVC"];
    KEYWINDOW.rootViewController = guideVC;
    
}

- (void)gotoHomePageVC
{
    UITabBarController *tabBar = [MAINSB instantiateViewControllerWithIdentifier:@"mainTabBC"];
    KEYWINDOW.rootViewController = tabBar;
}

- (void)gotoWebVC:(NSString *)name
              nav:(UINavigationController *)nav
{
    WebController *webVC = [MAINSB instantiateViewControllerWithIdentifier:@"webview"];
    webVC.name = name;
    [nav pushViewController:webVC animated:YES];
}


- (void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}


+ (void)changeNavgationStyle:(UINavigationController *)nav
{
    [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],
                                                                     NSForegroundColorAttributeName,
                                                                     [UIFont boldSystemFontOfSize:20],
                                                                     NSFontAttributeName,nil]];
    nav.navigationBar.barTintColor = [UIColor redColor];
    nav.navigationBar.tintColor = [UIColor whiteColor];
}



@end
