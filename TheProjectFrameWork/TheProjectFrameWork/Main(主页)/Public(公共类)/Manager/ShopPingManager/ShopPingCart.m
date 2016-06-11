//
//  ShopPingCart.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ShopPingCart.h"
#import "ShoppingModel.h"
#define kArchivingShoppingCartKey @"kArchivingShoppingCartKey"

@interface ShopPingCart ()<NSCopying,NSCoding>

@end

@implementation ShopPingCart

static ShopPingCart * shoppingcat = nil;

+(ShopPingCart *)ShareShopping{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 解档
        NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self ShopPingCartPath]];
        if (data.length) {
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            shoppingcat = [unarchiver decodeObjectForKey:kArchivingShoppingCartKey];// initWithCoder方法被调用
            [unarchiver finishDecoding];
        }
        if (!shoppingcat) {
            shoppingcat = [[ShopPingCart alloc] init];
            shoppingcat.shoppingArray = [NSMutableArray array];
        }
    });
    return shoppingcat;
}

-(NSArray*)Shoppinglist{
    return shoppingcat.shoppingArray;
}
-(void)AddShoppingListwith:(ShoppingModel*)model{
    

    if (![shoppingcat ShoppingArrayIsContainsModelOrModelNumberAdd:model]){
        model.goodsNumber = 1;
        [shoppingcat.shoppingArray addObject:model];
    }
}
-(BOOL)ShoppingArrayIsContainsModelOrModelNumberAdd:(ShoppingModel*)model{
    for (ShoppingModel * checkmodel in shoppingcat.shoppingArray) {
        if ([model.goodsId isEqualToString:checkmodel.goodsId]) {
            checkmodel.goodsNumber++;
            return YES;
        }
    }
    return NO;
}

-(BOOL)ShoppingArrayIsContainsModel:(ShoppingModel*)model{
    for (ShoppingModel * checkmodel in shoppingcat.shoppingArray) {
        if ([model.goodsId isEqualToString:checkmodel.goodsId]) {
            return YES;
        }
    }
    return NO;
}
-(void)goodsRemoveFromeShoppingCartWithModel:(ShoppingModel*)model{
    for (ShoppingModel * checkmodel in shoppingcat.shoppingArray) {
        if ([model.goodsId isEqualToString:checkmodel.goodsId]) {
            [shoppingcat.shoppingArray removeObject:checkmodel];
        }
    }
}
-(NSInteger)allGoodsNumber{
    NSInteger totalNumber = 0;
    for (ShoppingModel * checkmodel in shoppingcat.shoppingArray) {
        totalNumber+=checkmodel.goodsNumber;
       }
    UITabBarController * tabController = (UITabBarController*)kRootViewController;
    UIViewController * requiredViewController = [tabController.viewControllers objectAtIndex:3];
    UITabBarItem * item = requiredViewController.tabBarItem;
    NSString * badgeValue = [NSString stringWithFormat:@"%ld",totalNumber];
    [item setBadgeValue:badgeValue];
    return totalNumber;
}
-(NSString *)allGoodPrices{
    CGFloat price  = 0;
    for (ShoppingModel * checkmodel in shoppingcat.shoppingArray) {
        price+=(checkmodel.goodsNumber*[checkmodel.goodsPrices floatValue]);
    }
    if (price==0) {
        return @"";
    }
    return [NSString stringWithFormat:@"%g",price];
}


#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)Coder {
    
    [Coder encodeObject:self.shoppingArray forKey:@"shoppingArray"];
    
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self) {
        self.shoppingArray = [aDecoder decodeObjectForKey:@"shoppingArray"];
        if (self.shoppingArray == nil) {
            self.shoppingArray = [NSMutableArray array];
        }
    }
    return self;
    
}

#pragma mark - NSCopying
- (id)copyWithZone:(nullable NSZone *)zone {
    ShopPingCart * shopcopy = [[[self class] allocWithZone:zone] init];
    shopcopy.shoppingArray = [self.shoppingArray copyWithZone:zone];
    return shopcopy;
}
/**
 *  路径
 *
 *  @return <#return value description#>
 */
+ (NSString *)ShopPingCartPath {
    NSString * handlePathFolder = [NSHomeDirectory() stringByAppendingPathComponent:@"ShopPingCartPathFolder"];
    NSString * handlePath = [handlePathFolder stringByAppendingPathComponent:@"SHOP.ach"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:handlePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:handlePathFolder withIntermediateDirectories:YES attributes:nil error:nil];
        [[NSFileManager defaultManager] createFileAtPath:handlePath contents:nil attributes:nil];
    }
    return handlePath;
}
/**
 *  归档
 */
- (void)saveToLocal {
    
    // 归档到本地
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:kArchivingShoppingCartKey]; // archivingDate的encodeWithCoder方法被调用
    [archiver finishEncoding];
    //写入文件
    [data writeToFile:[ShopPingCart ShopPingCartPath] atomically:YES];
}

@end
