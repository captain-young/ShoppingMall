//
//  HttpRequestManage.m
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "HttpRequestManage.h"

@implementation HttpRequestManage


#pragma POST请求
+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (ReturnValueBlock) block
                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
                     WithFailureBlock: (FailureBlock) failureBlock
{
    
    
}

#pragma GET请求
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
                    WithFailureBlock: (FailureBlock) failureBlock

{

    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:requestURLString parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              ProductModel *model = [ProductModel mj_objectWithKeyValues:responseObject];
              block(model);
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"%@",error.description);
              failureBlock();
    }];
}


@end
