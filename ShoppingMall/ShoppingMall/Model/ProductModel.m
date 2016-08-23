//
//  ProductModel.m
//  ShoppingMall
//
//  Created by white on 15/12/31.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"data":@"DataModel"};
}

@end


@implementation DataModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"createTime" : @"TimeModel",
             @"onlineTime" : @"TimeModel"};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID"      : @"id",
             @"kNewTag" : @"newTag"};
}

@end



@implementation TimeModel



@end