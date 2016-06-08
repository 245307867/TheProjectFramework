//
//  ClassfiactionHeadTypeImageCollectionReusableView.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/4.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClassfiactionHeadTypeImageCollectionReusableViewDelegate <NSObject>

-(void)ClassfiactionHeadTypeImageCollectionReusableViewClickedWithindexPath:(NSIndexPath*)index;

@end
@interface ClassfiactionHeadTypeImageCollectionReusableView : UICollectionReusableView
/** 推荐 */
@property (weak, nonatomic) IBOutlet UIImageView *recommendImageView;
/** index */
@property(strong,nonatomic) NSIndexPath * indexpath;
/** 代理 */
@property(assign,nonatomic) id <ClassfiactionHeadTypeImageCollectionReusableViewDelegate>delegate;
/** 加载推荐图片 */
-(void)loadRecommendImageViewModel:(id)model WithIndex:(NSIndexPath*)indexpath;

@end
