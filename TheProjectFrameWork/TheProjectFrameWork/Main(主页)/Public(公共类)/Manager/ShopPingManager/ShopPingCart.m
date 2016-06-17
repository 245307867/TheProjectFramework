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


+(ShopPingCart *)ShareShopping{
    static dispatch_once_t onceToken;
    static ShopPingCart * shoppingcat = nil;

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
        [shoppingcat addObserver:shoppingcat forKeyPath:@"shoppingArray" options: NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    });
    return shoppingcat;
}

-(NSArray*)Shoppinglist{
    NSArray * array = [[ShopPingCart ShareShopping].shoppingArray copy];
    return array;
}
-(void)AddShoppingListwith:(ShoppingModel*)model{
    if (![[ShopPingCart ShareShopping] ShoppingArrayIsContainsModelOrModelNumberAdd:model]){
        model.goodsNumber = 1;
        [[[ShopPingCart ShareShopping]mutableArrayValueForKey:@"shoppingArray" ] addObject:model];
    }
}
-(BOOL)ShoppingArrayIsContainsModelOrModelNumberAdd:(ShoppingModel*)model{
    for (ShoppingModel * checkmodel in [[ShopPingCart ShareShopping] mutableArrayValueForKey:@"shoppingArray"]) {
        if ([model.goodsId isEqualToString:checkmodel.goodsId]) {
            checkmodel.goodsNumber++;
            return YES;
        }
    }
    return NO;
}

-(BOOL)ShoppingArrayIsContainsModel:(ShoppingModel*)model{
    for (ShoppingModel * checkmodel in [ShopPingCart ShareShopping].shoppingArray) {
        if ([model.goodsId isEqualToString:checkmodel.goodsId]) {
            return YES;
        }
    }
    return NO;
}
-(void)goodsRemoveFromeShoppingCartWithArray:(NSArray *)array{
    [[[ShopPingCart ShareShopping] mutableArrayValueForKey:@"shoppingArray"] removeObjectsInArray:array];
}
-(void)goodsRemoveFromeShoppingCartWithModel:(ShoppingModel*)model{
    [[[ShopPingCart ShareShopping] mutableArrayValueForKey:@"shoppingArray"] removeObject:model];
    /*  
      移除一个 model  从数组中 
    NSMutableArray * array =[shoppingcat.shoppingArray copy];
    for (ShoppingModel * checkmodel in array) {
        if ([model.goodsId isEqualToString:checkmodel.goodsId]) {
            
            [shoppingcat.shoppingArray removeObject:checkmodel];
        }
    }
     */
}
-(NSInteger)allGoodsNumber{
    NSInteger totalNumber = 0;
    for (ShoppingModel * checkmodel in [ShopPingCart ShareShopping].shoppingArray) {
        totalNumber+=checkmodel.goodsNumber;
       }
    NSString * badgeValue = [NSString stringWithFormat:@"%ld",totalNumber];
    UITabBarController * tabController = (UITabBarController*)kRootViewController;
    [tabController.tabBar showBadgeOnItemIndex:3 withBadgeValue:badgeValue];
    return totalNumber;
}
-(NSInteger)allGoodsPamentNumber{
    NSInteger totalNumber = 0;
    NSInteger pamentNumber = 0;

    for (ShoppingModel * checkmodel in [ShopPingCart ShareShopping].shoppingArray) {
        if (checkmodel.goodspayment) {
            pamentNumber+=checkmodel.goodsNumber;
        }
        totalNumber+=checkmodel.goodsNumber;
    }
    NSString * badgeValue = [NSString stringWithFormat:@"%ld",totalNumber];
    UITabBarController * tabController = (UITabBarController*)kRootViewController;
    [tabController.tabBar showBadgeOnItemIndex:3 withBadgeValue:badgeValue];
    return pamentNumber;
}
-(NSString *)allGoodPrices{
    CGFloat price  = 0;
    for (ShoppingModel * checkmodel in [ShopPingCart ShareShopping].shoppingArray) {
        if (checkmodel.goodspayment) {
        price+=(checkmodel.goodsNumber*[checkmodel.goodsPrices floatValue]);
        }
    }
    if (price==0) {
        return @"";
    }
    return [NSString stringWithFormat:@"%g",price];
}

-(BOOL)selectAllGoodsPament{
    for (ShoppingModel * model in [ShopPingCart ShareShopping].shoppingArray) {
        if (!model.goodspayment) {
            model.goodspayment = YES;
        }
    }
    return YES;
}
-(BOOL)cancelSelectAllGoodsPament{
    for (ShoppingModel * model in [ShopPingCart ShareShopping].shoppingArray) {
        if (model.goodspayment) {
            model.goodspayment = NO;
        }
    }
    return YES;
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

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
}

@end
