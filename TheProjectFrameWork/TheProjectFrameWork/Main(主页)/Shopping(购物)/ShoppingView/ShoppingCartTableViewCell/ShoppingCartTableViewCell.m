//
//  ShoppingCartTableViewCell.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/5.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"
#import "ShoppingButtonView.h"
#import "ShoppingModel.h"

@interface ShoppingCartTableViewCell ()<ShoppingButtonViewDelegate>

@end

@implementation ShoppingCartTableViewCell

- (void)awakeFromNib {

    // Initialization code
}

-(void)goodsLoadShoppingCartWithModel:(ShoppingModel*)model andIndexPath:(NSIndexPath *)indexPath{
    self.goodsDetialImageView.image = [UIImage imageNamed:model.goodsImageUrl];
    self.goodsNameLabel.text = model.goodsName;
    self.goodsmodel = model;
    self.goodsSelectButton.selected = model.goodspayment;
    self.goodsDescribtionLabel.text= model.goodsDescription;
    ShoppingButtonView * view =[ShoppingButtonView loadShoppingButtonViewWithShoppingNumber:model.goodsNumber frame:self.goodsView.bounds];
    view.delegate = self;
    [self.goodsView addSubview:view];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)shoppingNumberChangeedvalue:(NSInteger )number{
    self.goodsmodel.goodsNumber = number;
    if ([self.delegate respondsToSelector:@selector(goodsNumberChangeedWith:withIndexPath:)]) {
        [self.delegate goodsNumberChangeedWith:self.goodsmodel withIndexPath:self.indexPath];
    }
}
- (IBAction)selectedButtonClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(goodsModelSelected:withIndexPath:)]) {
        [self.delegate goodsModelSelected:self.goodsmodel withIndexPath:self.indexPath];
    }
    
}

@end
