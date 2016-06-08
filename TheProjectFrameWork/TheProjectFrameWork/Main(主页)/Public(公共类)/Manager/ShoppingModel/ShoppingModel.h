//
//  ShoppingModel.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/8.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "BaseModel.h"

@interface ShoppingModel : BaseModel
/** 商品名称 */
@property(copy,atomic) NSString * goodsName;
/** 单价 */
@property(copy,atomic) NSString * goodsPrices;
/** 图片地址 */
@property(copy,atomic) NSString * goodsImageUrl;
/** 商品id */
@property(copy,atomic) NSString * goodsId;
/** 商品数量 */
@property(assign,atomic) NSInteger  goodsNumber;
/** 创建时间 */
@property(copy,atomic) NSString * creatTime;
/** 商品描述 */
@property(copy,atomic) NSString * goodsDescription;
/** 商品详情 */
@property(copy,atomic) NSString * goodsDetails;
/** 商品总价 */
@property(copy,atomic) NSString * goodsAllPrices;
/** 商品标示符 */
@property(copy,atomic) NSString * goodsSuit;

@end
