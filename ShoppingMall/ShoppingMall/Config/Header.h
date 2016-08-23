//
//  Header.h
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#ifndef Header_h
#define Header_h

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^SuccessBlock) (id loadValue);

#define USERDEFULTS    [NSUserDefaults standardUserDefaults]
#define SCREEN_W       [UIScreen mainScreen].bounds.size.width
#define SCREEN_H       [UIScreen mainScreen].bounds.size.height
#define AFMANAGE       [AFHTTPRequestOperationManager manager]
#define VERSION         @"CFBundleShortVersionString"
#define KEYWINDOW       [[[UIApplication sharedApplication] delegate] window]
#define MAINSB          [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define AFMANAGE        [AFHTTPRequestOperationManager manager]


#endif /* Header_h */
