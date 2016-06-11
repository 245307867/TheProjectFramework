//
//  AppDelegate+PrivateMethods.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "AppDelegate+PrivateMethods.h"
#import "ShopPingCart.h"

@implementation AppDelegate (PrivateMethods)
-(void)ProjectSetRootViewController{
    self.window = [[UIWindow alloc] initWithFrame:kScreenFreameBound];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController * mianTabBar = [[UITabBarController alloc] init];
    // 首页
    UIStoryboard * homeStoryBoard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UINavigationController * homeNaV = [homeStoryBoard instantiateInitialViewController];
    homeNaV.tabBarItem.title = @"首页";
    homeNaV.tabBarItem.image = [UIImage imageNamed:@"tabBar_home_normal"];
    homeNaV.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_home_press"];
    // 分类
    UIStoryboard * classificationStoryBoard = [UIStoryboard storyboardWithName:@"Classification" bundle:nil];
    UINavigationController * classificationNaV = [classificationStoryBoard instantiateInitialViewController];
    classificationNaV.tabBarItem.title = @"分类";
    classificationNaV.tabBarItem.image = [UIImage imageNamed:@"tabBar_category_normal"];
    classificationNaV.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_category_press"];

    //发现
    UIStoryboard * foundStoryBoard = [UIStoryboard storyboardWithName:@"Found" bundle:nil];
    UINavigationController *foundNaV = [foundStoryBoard instantiateInitialViewController];
    foundNaV.tabBarItem.title = @"发现";
    foundNaV.tabBarItem.image = [UIImage imageNamed:@"tabBar_find_normal"];
    foundNaV.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_find_press"];

    //购物车
    UIStoryboard * shoppingCartStoryBoard = [UIStoryboard storyboardWithName:@"ShoppingCart" bundle:nil];
    UINavigationController *shoppingCartNaV = [shoppingCartStoryBoard instantiateInitialViewController];
    shoppingCartNaV.tabBarItem.title = @"购物车";
    shoppingCartNaV.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",[[ShopPingCart ShareShopping] allGoodsNumber]];
    shoppingCartNaV.tabBarItem.image = [UIImage imageNamed:@"tabBar_cart_normal"];
    shoppingCartNaV.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_cart_press"];

    //个人
    UIStoryboard * personalStoryBoard = [UIStoryboard storyboardWithName:@"Personal" bundle:nil];
    UINavigationController * personalNaV = [personalStoryBoard instantiateInitialViewController];
    personalNaV.tabBarItem.title = @"个人";
    personalNaV.tabBarItem.image = [UIImage imageNamed:@"tabBar_myJD_normal"];
    personalNaV.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_myJD_press"];

    // 设置tabBarController
    mianTabBar.viewControllers = @[homeNaV,classificationNaV,foundNaV,shoppingCartNaV,personalNaV];
    self.window.rootViewController = mianTabBar;
    [self.window makeKeyAndVisible];
    
}

@end
