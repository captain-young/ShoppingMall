//
//  ViewModelClass.h
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModelClass : NSObject

@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) ErrorCodeBlock errorBlock;
@property (strong, nonatomic) FailureBlock failureBlock;


- (BOOL)isFirstLogin;

- (void)gotoGuideVC;

- (void)gotoHomePageVC;

- (void)gotoWebVC:(NSString *)name nav:(UINavigationController *)nav;

-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock;

+ (void)changeNavgationStyle:(UINavigationController *)nav;



@end
