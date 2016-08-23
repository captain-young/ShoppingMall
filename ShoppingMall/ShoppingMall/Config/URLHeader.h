//
//  URLHeader.h
//  ShoppingMall
//
//  Created by white on 15/12/30.
//  Copyright © 2015年 Young. All rights reserved.
//

#ifndef URLHeader_h
#define URLHeader_h

#define     URL_HOMEPAGE(pno)         [NSString stringWithFormat:@"http://app.gouwubang.com/visit!productlist.do?channel=30&maxPrice=&minPrice=&name=&orderbyColumn=weight&orderbyType=desc&pno=%zd&productSource=&psize=20",pno]  


#define URL_NINE(pno)       [NSString stringWithFormat:@"http://app.gouwubang.com/visit!productlist.do?channel=31&maxPrice=&minPrice=&name=&orderbyColumn=weight&orderbyType=desc&pno=%zd&productSource=&psize=20",pno]

#define URL_IMAGE       @"http://t.gouwubang.com/product_images/"
#endif /* URLHeader_h */
