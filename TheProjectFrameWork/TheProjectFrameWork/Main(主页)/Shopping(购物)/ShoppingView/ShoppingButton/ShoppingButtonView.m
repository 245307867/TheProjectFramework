//
//  ShoppingButtonView.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/7.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ShoppingButtonView.h"

@implementation ShoppingButtonView
+(ShoppingButtonView*)loadShoppingButtonViewWithShoppingNumber:(NSInteger )number frame:(CGRect)frame{
    ShoppingButtonView * view = [[[NSBundle mainBundle] loadNibNamed:@"ShoppingButtonView" owner:nil options:nil] firstObject];
    view.frame = frame;
    view.shoppingNumber.backgroundColor = [UIColor whiteColor];
    view.goodsNumber = number;
    view.shoppingNumber.text = [NSString stringWithFormat:@"%ld",view.goodsNumber];
    return view;
}
- (IBAction)addButtonClicked:(UIButton *)sender {
    self.goodsNumber++;
    self.shoppingNumber.text = [NSString stringWithFormat:@"%ld",self.goodsNumber];
    [self.delegate shoppingNumberChangeedvalue:self.goodsNumber];
}
- (IBAction)subtractButtonClicked:(UIButton *)sender{
    if (self.goodsNumber <=1) {
    }
    else{
        self.goodsNumber--;
        self.shoppingNumber.text = [NSString stringWithFormat:@"%ld",self.goodsNumber];
        [self.delegate shoppingNumberChangeedvalue:self.goodsNumber];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
