//
//  ShoppingCartTableViewCell.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/5.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartTableViewCell : UITableViewCell

/** 货物图片 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsDetialImageView;
/** 物品名称 */
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
/** 物品描述 */
@property (weak, nonatomic) IBOutlet UILabel *goodsDescribtionLabel;
/** 物品数量 */
@property (weak, nonatomic) IBOutlet UILabel *goodsNumber;
/** 获取某个cell */
@property (strong,nonatomic) NSIndexPath *indexPath;
/**
 *  cell 加载
 *
 *  @param Model
 *  @param indexPath 
 */
-(void)goodsLoadShoppingCartWithModel:(id)Model andIndexPath:(NSIndexPath*)indexPath;

@end
