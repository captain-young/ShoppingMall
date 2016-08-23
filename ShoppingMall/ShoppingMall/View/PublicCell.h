//
//  PublicCell.h
//  ShoppingMall
//
//  Created by white on 15/12/31.
//  Copyright © 2015年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UILabel *discountLab;
@property (weak, nonatomic) IBOutlet UILabel *postage;

@end
