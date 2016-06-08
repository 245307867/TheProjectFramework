//
//  AppMacros.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#ifndef AppMacros_h
#define AppMacros_h

//
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define RGBCOLOR(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]

// Tabbar高度
#define KTabBarHeight 49
// 导航栏高度
#define kNavigaTionBarHeight 64
// CollectionViewCell高度
#define KPersonalCollectionViewCellHeight 80

#define KArc4andomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]
#define KArc4andomPrices [NSString stringWithFormat:@"%u",arc4random()%255] ;

#endif /* AppMacros_h */
