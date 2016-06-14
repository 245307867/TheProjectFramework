//
//  PersonalHeadCollectionReusableView.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonalHeadCollectionReusableViewDelegate <NSObject>

-(void)PersonalHeadCollectionReusableViewHeadClickedWithIndex:(NSInteger)section;

@end

@interface PersonalHeadCollectionReusableView : UICollectionReusableView

@property (assign, nonatomic) NSInteger section;

@property(assign,nonatomic) id <PersonalHeadCollectionReusableViewDelegate> delegate;
-(void)personalWithsection:(NSInteger)section;
@end
