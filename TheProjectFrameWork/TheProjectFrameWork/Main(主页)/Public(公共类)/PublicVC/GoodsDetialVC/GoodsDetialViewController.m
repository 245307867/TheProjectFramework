//
//  GoodsDetialViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/8.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "GoodsDetialViewController.h"
#import "ShoppingModel.h"
#import "ShopPingCart.h"
@interface GoodsDetialViewController ()
/** 商品价格 */
@property (weak, nonatomic) IBOutlet UILabel *goodsPricelabel;
/** 商品描述 */
@property (weak, nonatomic) IBOutlet UILabel *goodsDescriptionLabel;
/** 商品图片 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;

@end

@implementation GoodsDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.goodsmodel.goodsDescription;
    self.goodsPricelabel.text =[NSString stringWithFormat:@"商品单价:$ %@",self.goodsmodel.goodsPrices] ;
    self.goodsImageView.image = [UIImage imageNamed:self.goodsmodel.goodsImageUrl];
    self.goodsDescriptionLabel.text = self.goodsmodel.goodsDescription;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addToShoppingCart:(UIButton *)sender {
    [[ShopPingCart ShareShopping] AddShoppingListwith:self.goodsmodel];
    
}

- (IBAction)shoppingCart:(UIButton *)sender {
    UIStoryboard * shoppingcart = [UIStoryboard storyboardWithName:@"ShoppingCart" bundle:nil];
    UIViewController * view = [shoppingcart instantiateViewControllerWithIdentifier:@"ShoppingViewController"];
    [self.navigationController pushViewController:view animated:YES];
}
- (IBAction)ContactTheShopper:(UIButton *)sender {
}
- (IBAction)CustomerService:(UIButton *)sender {
}

@end
