//
//  HometableHeadView.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/4.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

@class SDCycleScrollView;
#import "BaseView.h"

@interface HometableHeadView : BaseView
/** 轮播图 */
@property (weak, nonatomic) IBOutlet SDCycleScrollView *imagePlayerScrollerView;

+(HometableHeadView*)headViewLoadView;
@end
