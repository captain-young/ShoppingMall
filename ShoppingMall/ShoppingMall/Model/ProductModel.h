//
//  ProductModel.h
//  ShoppingMall
//
//  Created by white on 15/12/31.
//  Copyright © 2015年 Young. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TimeModel;
@interface ProductModel : NSObject

@property (nonatomic,copy) NSString          *status;
@property (nonatomic,copy) NSString          *msg;
@property (nonatomic,copy) NSString          *channel;
@property (nonatomic,copy) NSString          *orderbyColumn;
@property (nonatomic,copy) NSString          *orderbyType;
@property (nonatomic,copy) NSString          *name;
@property (nonatomic,copy) NSString          *pno;
@property (nonatomic,copy) NSString          *psize;
@property (nonatomic,copy) NSString          *count;
@property (nonatomic,retain) NSArray         *data;


@end


@interface DataModel : NSObject

@property (nonatomic,copy) NSString          *ID;
@property (nonatomic,copy) NSString          *campaignId;
@property (nonatomic,copy) NSString          *categoryId;
@property (nonatomic,copy) NSString          *clickAmount;
@property (nonatomic,copy) NSString          *commentAmount;
@property (nonatomic,retain) TimeModel       *createTime;
@property (nonatomic,copy) NSString          *labelId;
@property (nonatomic,copy) NSString          *name;
@property (nonatomic,copy) NSString          *kNewTag;
@property (nonatomic,retain) TimeModel       *onlineTime;
@property (nonatomic,copy) NSString          *originalPrice;
@property (nonatomic,copy) NSString          *picUrl;
@property (nonatomic,copy) NSString          *promo;
@property (nonatomic,assign) float           rebatePrice;
@property (nonatomic,copy) NSString          *salesVolume;
@property (nonatomic,copy) NSString          *status;

@end


@interface TimeModel : NSObject

@property (nonatomic,copy) NSString          *date;
@property (nonatomic,copy) NSString          *day;
@property (nonatomic,copy) NSString          *hours;
@property (nonatomic,copy) NSString          *minutes;
@property (nonatomic,copy) NSString          *month;
@property (nonatomic,copy) NSString          *nanos;
@property (nonatomic,copy) NSString          *seconds;
@property (nonatomic,copy) NSString          *time;
@property (nonatomic,copy) NSString          *timezoneOffset;
@property (nonatomic,copy) NSString          *year;

@end