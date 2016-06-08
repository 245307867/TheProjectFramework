//
//  ShoppingButtonView.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/7.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "BaseView.h"

@protocol ShoppingButtonViewDelegate <NSObject>

-(void)shoppingNumberChangeedvalue:(NSInteger)number;
@end

@interface ShoppingButtonView : BaseView


/** 减 */
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;
/** 购物数量 */
@property (weak, nonatomic) IBOutlet UILabel *shoppingNumber;
/** 加 */
@property (weak, nonatomic) IBOutlet UIButton *addButton;
/** 货物数量 */
@property(assign,nonatomic) NSInteger  goodsNumber;

@property(assign,nonatomic) id<ShoppingButtonViewDelegate> delegate;

+(ShoppingButtonView*)loadShoppingButtonViewWithShoppingNumber:(NSInteger )number frame:(CGRect)frame;
@end
