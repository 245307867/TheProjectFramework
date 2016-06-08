//
//  ShopPingCart.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShoppingModel;
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
-(NSArray*)Shoppinglist;
/**
 *  添加到购物车中
 *
 *  @param model <#model description#>
 */
-(void)AddShoppingListwith:(ShoppingModel*)model;
/**
 *  购物车中是否存在
 *
 *  @param model <#model description#>
 *
 *  @return <#return value description#>
 */
-(BOOL)ShoppingArrayIsContainsModel:(ShoppingModel*)model;
/**
 *  移除商品从购物车
 *
 *  @param model <#model description#>
 */
-(void)goodsRemoveFromeShoppingCartWithModel:(ShoppingModel*)model;
/**
 *  归档到本地
 */
- (void)saveToLocal;
/**
 *  查询购物车商品总数
 *
 *  @return 返回个数
 */
-(NSInteger)allGoodsNumber;
/**
 *  查询所有货物列表
 *
 *  @return <#return value description#>
 */
-(NSString*)allGoodPrices;

@end
