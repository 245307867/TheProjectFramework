//
//  FoundView.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/14.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "BaseView.h"
@class FoundView;
@protocol FoundViewDelegate <NSObject>

-(void)FoundViewtabelViewSelected:(FoundView*)foundview WithIndexPath:(NSIndexPath*)indexpath;

-(void)FoundViewtabelViewScrolled:(FoundView*)foundview  withScrollerView:(UIScrollView*)scrollerView ;

@end

@interface FoundView : BaseView
/* 列表 */
@property (weak, nonatomic) IBOutlet UITableView * foundTableView;
/** 数据 */
@property(strong,nonatomic) NSMutableArray * tableviewDataArray;

@property(assign,nonatomic) id <FoundViewDelegate> delegate;




+(FoundView*)createFoundView;
-(void)loadDataSourceWithArray:(NSArray*)array;
@end
