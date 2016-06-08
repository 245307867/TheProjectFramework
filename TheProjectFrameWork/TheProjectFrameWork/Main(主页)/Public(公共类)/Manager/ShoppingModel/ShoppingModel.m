//
//  ShoppingModel.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/8.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ShoppingModel.h"

@interface ShoppingModel ()<NSCoding>


@end

@implementation ShoppingModel

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
 
    // 将内存中不同位置的内容放到一起
    [aCoder encodeObject:self.goodsName forKey:@" goodsName"];
    [aCoder encodeObject:self.goodsPrices forKey:@"goodsPrices"];
    [aCoder encodeObject:self.goodsImageUrl forKey:@"goodsImageUrl"];
    [aCoder encodeObject:self.goodsId forKey:@"goodsId"];
    [aCoder encodeObject:@(self.goodsNumber) forKey:@"goodsNumber"];
    [aCoder encodeObject:self.creatTime forKey:@"creatTime"];
    [aCoder encodeObject:self.goodsDescription forKey:@"goodsDescription"];
    [aCoder encodeObject:self.goodsDetails forKey:@"goodsDetails"];
    [aCoder encodeObject:self.goodsAllPrices forKey:@"goodsAllPrices"];
    [aCoder encodeObject:self.goodsSuit forKey:@"goodsSuit"];
    
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.goodsName = [aDecoder decodeObjectForKey:@"goodsName"];
        self.goodsPrices  = [aDecoder decodeObjectForKey:@"goodsPrices"];
        self.goodsImageUrl = [aDecoder decodeObjectForKey:@"goodsImageUrl"];
        self.goodsId = [aDecoder decodeObjectForKey:@"goodsId"];
        self.goodsNumber = [[aDecoder decodeObjectForKey:@"goodsNumber"] integerValue];
        self.creatTime = [aDecoder decodeObjectForKey:@"creatTime"];
        self.goodsDescription = [aDecoder decodeObjectForKey:@"goodsDescription"];
        self.goodsDetails = [aDecoder decodeObjectForKey:@"goodsDetails"];
        self.goodsAllPrices = [aDecoder decodeObjectForKey:@"goodsAllPrices"];
        self.goodsSuit = [aDecoder decodeObjectForKey:@"goodsSuit"];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(nullable NSZone *)zone{
    ShoppingModel * copy = [[[self class] allocWithZone:zone] init];
    copy.goodsName = [self.goodsName copyWithZone:zone];
    copy.goodsNumber = self.goodsNumber;
    copy.goodsPrices = [self.goodsPrices copyWithZone:zone];
    copy.goodsImageUrl = [self.goodsImageUrl copyWithZone:zone];
    copy.goodsId = [self.goodsId copyWithZone:zone];
    copy.creatTime = [self.creatTime copyWithZone:zone];
    copy.goodsDescription = [self.goodsDescription copyWithZone:zone];
    copy.goodsDetails = [self.goodsDetails copyWithZone:zone];
    copy.goodsAllPrices = [self.goodsAllPrices copyWithZone:zone];//添加判断属于某个DB
    copy.goodsSuit = [self.goodsSuit copyWithZone:zone];
    return copy;
    
}


@end
