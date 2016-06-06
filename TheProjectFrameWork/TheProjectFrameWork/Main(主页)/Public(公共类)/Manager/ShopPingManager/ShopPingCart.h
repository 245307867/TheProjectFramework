//
//  ShopPingCart.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopPingCart : NSObject
/** 购物车货物列表*/
@property (atomic, strong) NSMutableArray * shoppingArray;
/**
 *  购物车初始化
 *
 *  @return <#return value description#>
 */
+(ShopPingCart*)ShareShopping;
/**
 *  购物车货物列表
 *
 *  @return <#return value description#>
 */
+(NSArray*)Shoppinglist;
@end
