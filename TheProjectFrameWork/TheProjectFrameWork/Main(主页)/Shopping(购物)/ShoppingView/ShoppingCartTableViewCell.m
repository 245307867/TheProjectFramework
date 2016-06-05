//
//  ShoppingCartTableViewCell.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/5.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"

@implementation ShoppingCartTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)goodsLoadShoppingCartWithModel:(id)Model andIndexPath:(NSIndexPath *)indexPath{
    self.goodsDetialImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
