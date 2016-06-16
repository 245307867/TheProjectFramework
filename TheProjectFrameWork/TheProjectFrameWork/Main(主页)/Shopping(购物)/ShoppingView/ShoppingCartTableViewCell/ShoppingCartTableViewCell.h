//
//  ShoppingCartTableViewCell.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/5.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//
#import <UIKit/UIKit.h>
@class ShoppingButtonView;
@class ShoppingModel;
@protocol ShoppingCartTableViewCellDelegate <NSObject>

-(void)goodsNumberChangeedWith:(ShoppingModel*)goodsmodel withIndexPath:(NSIndexPath*)indexPath;

-(void)goodsModelSelected:(ShoppingModel*)goodsmodel withIndexPath:(NSIndexPath*)indexpath;
@end

@interface ShoppingCartTableViewCell : UITableViewCell
/** 货物选择图片 */
@property (weak, nonatomic) IBOutlet UIButton *goodsSelectButton;
/** 货物图片 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsDetialImageView;
/** 物品名称 */
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
/** 物品描述 */
@property (weak, nonatomic) IBOutlet UILabel *goodsDescribtionLabel;
/** 物品数量View */
@property (weak, nonatomic) IBOutlet UIView *goodsView;
/** 获取某个cell */
@property (strong,nonatomic)  NSIndexPath *indexPath;
/** 商品 */
@property(strong,nonatomic) ShoppingModel * goodsmodel;
/** 代理回调 */
@property(assign,nonatomic)   id<ShoppingCartTableViewCellDelegate> delegate;
/**
 *  cell 加载
 *
 *  @param Model
 *  @param indexPath 
 */
-(void)goodsLoadShoppingCartWithModel:(ShoppingModel*)model andIndexPath:(NSIndexPath*)indexPath;

@end
