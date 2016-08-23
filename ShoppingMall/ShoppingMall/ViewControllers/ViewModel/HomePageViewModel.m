//
//  HomePageViewModel.m
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#import "HomePageViewModel.h"

//static NSInteger pno = 0;
@implementation HomePageViewModel

- (void)dealWithProductData:(NSString *)urlStr{
    
    [HttpRequestManage NetRequestGETWithRequestURL:urlStr WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        
        ProductModel *model = returnValue;
        self.returnBlock(model.data);
        
    } WithErrorCodeBlock:^(id errorCode) {
        
    } WithFailureBlock:^{
        
    }];
}


+ (void)fetchDataWithCell:(PublicCell *)cell
                     data:(NSArray *)data
                indexPath:(NSIndexPath *)indextPath
{
    DataModel *model = data[indextPath.row];
    NSString *oldPrice = [NSString stringWithFormat:@"￥%.1f",[model.originalPrice floatValue]];
    NSString *sellPrice = [NSString stringWithFormat:@"¥%.1f",model.rebatePrice ];
    NSString * discount = [NSString stringWithFormat:@"%.1f折",model.rebatePrice/[model.originalPrice floatValue]*10];
    NSString *selledCount = [NSString stringWithFormat:@"已售%@件",model.salesVolume];
    NSMutableAttributedString *price = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",sellPrice,oldPrice]];
    NSMutableAttributedString *dicontInfo = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@  %@",discount,selledCount]];
    
    [price addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],
                              NSForegroundColorAttributeName:[UIColor lightGrayColor],
                              NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),
                              NSStrikethroughColorAttributeName:[UIColor lightGrayColor]
                              }
                   range:NSMakeRange(sellPrice.length+1, oldPrice.length)];
    [price addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                              NSForegroundColorAttributeName:[UIColor redColor],
                        }
                   range:NSMakeRange(0, sellPrice.length)];
    
    [dicontInfo addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                              NSForegroundColorAttributeName:[UIColor lightGrayColor],
                              }
                        range:NSMakeRange(0, discount.length)];
    [dicontInfo addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                                NSForegroundColorAttributeName:[UIColor grayColor],
                                }
                        range:NSMakeRange(discount.length+2, selledCount.length)];
    
    [cell.headImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_IMAGE,model.picUrl]]];
    cell.titleLab.text = model.name;
    cell.postage.text = model.promo;
    
    cell.priceLab.attributedText = price;
    cell.discountLab.attributedText = dicontInfo;
}


- (void)refreshData:(UITableView *)tableView
                url:(NSString *)url
{
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self dealWithProductData:url];
    }];
    tableView.header = header;
    [tableView.header beginRefreshing];
}


- (void)infinityData:(UITableView *)tableView
                 url:(NSString *)url
             success:(SuccessBlock)block
{
        tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [HttpRequestManage NetRequestGETWithRequestURL:url WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
            ProductModel *model = returnValue;
            block(model.data);
        } WithErrorCodeBlock:^(id errorCode) {
            
        } WithFailureBlock:^{
            
        }];
    }];
    tableView.footer.hidden = YES;
}

+ (NSMutableArray *)sortProductPrice:(NSArray *)array accend:(BOOL)accending
{
    return nil;
}



@end
