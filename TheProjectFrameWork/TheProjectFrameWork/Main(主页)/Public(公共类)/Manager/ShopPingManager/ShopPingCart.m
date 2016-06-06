//
//  ShopPingCart.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ShopPingCart.h"

@implementation ShopPingCart

static ShopPingCart * shoppingcat = nil;

+(ShopPingCart *)ShareShopping{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shoppingcat = [[ShopPingCart alloc] init];
        shoppingcat.shoppingArray = [NSMutableArray array];
    });
    return shoppingcat;
}

+(NSArray*)Shoppinglist{
    return shoppingcat.shoppingArray;
}

@end
