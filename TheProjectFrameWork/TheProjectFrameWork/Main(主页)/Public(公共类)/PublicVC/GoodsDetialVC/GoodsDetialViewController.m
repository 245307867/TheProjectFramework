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
#import "ButtonView.h"
@interface GoodsDetialViewController ()
/** 购物buttonView */
@property (weak, nonatomic) IBOutlet UIView *shoppingView;
/** 商品价格 */
@property (weak, nonatomic) IBOutlet UILabel *goodsPricelabel;
/** 商品描述 */
@property (weak, nonatomic) IBOutlet UILabel *goodsDescriptionLabel;
/** 商品图片 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;

@end

@implementation GoodsDetialViewController
{
    ButtonView * buttonview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self LoadButtonView];
}
-(void)LoadButtonView{
    if (!buttonview) {
        buttonview  = [ButtonView loadButtonViewWith:nil andbadgeValue:@"20" andFreme:self.shoppingView.bounds];
        [buttonview.clickButton addTarget:self action:@selector(ShopViewClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.shoppingView addSubview:buttonview];
    }
    self.title = self.goodsmodel.goodsName;
    self.goodsPricelabel.text =[NSString stringWithFormat:@"商品单价:$ %@",self.goodsmodel.goodsPrices] ;
    if ([[ShopPingCart ShareShopping]allGoodsNumber]<1) {
        buttonview.badgeValuLabel.alpha = 0;
    }
    else{
        buttonview.badgeValuLabel.alpha = 1;
        buttonview.badgeValuLabel.text =[NSString stringWithFormat:@"%ld",[[ShopPingCart ShareShopping]allGoodsNumber]];
    }
    self.goodsImageView.image = [UIImage imageNamed:self.goodsmodel.goodsImageUrl];
    self.goodsDescriptionLabel.text = self.goodsmodel.goodsDescription;

    
}
-(void)ShopViewClicked{
    
    UIStoryboard * shoppingcart = [UIStoryboard storyboardWithName:@"ShoppingCart" bundle:nil];
    UIViewController * view = [shoppingcart instantiateViewControllerWithIdentifier:@"ShoppingViewController"];
    [self.navigationController pushViewController:view animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addToShoppingCart:(UIButton *)sender {
    [[ShopPingCart ShareShopping] AddShoppingListwith:self.goodsmodel];
    [self shpopingaddAnimatedWithFrame:sender.frame blocks:^{
        if ([[ShopPingCart ShareShopping]allGoodsNumber]<1) {
            buttonview.badgeValuLabel.alpha = 0;
        }
        else{
            buttonview.badgeValuLabel.alpha = 1;
            buttonview.badgeValuLabel.text =[NSString stringWithFormat:@"%ld",[[ShopPingCart ShareShopping]allGoodsNumber]];
        }
    }];
 
    
}

- (IBAction)ContactTheShopper:(UIButton *)sender {
}
- (IBAction)CustomerService:(UIButton *)sender {
}

-(void)shpopingaddAnimatedWithFrame:(CGRect)frame blocks:(void (^)(void))block{
    UIButton *move = [[UIButton alloc] initWithFrame:CGRectMake(KScreenBoundWidth-frame.size.width, KScreenBoundHeight-frame.size.height, frame.size.width, frame.size.height)];
    [move setBackgroundColor:[UIColor redColor]];
    [move setTitle:self.title forState:UIControlStateNormal];
    [move setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    move.contentMode = UIViewContentModeScaleToFill;
    [[UIApplication sharedApplication].keyWindow addSubview:move];
    // 加入购物车动画效果
    [UIView animateWithDuration:0.5 animations:^{
        move.center = CGPointMake(KScreenBoundWidth/4*3, KScreenBoundHeight/5*4);
        move.frame = CGRectMake(KScreenBoundWidth/4*3,KScreenBoundHeight/5*4,frame.size.width/2, frame.size.height/3*2);

    } completion:^(BOOL finished) {
       [UIView animateWithDuration:0.5 animations:^{
           move.frame = CGRectMake(KScreenBoundWidth-frame.size.width-30,KScreenBoundHeight-frame.size.height,30, frame.size.height/2);
       } completion:^(BOOL finished) {
           [move removeFromSuperview];
           block();
       }];
    }];


}
@end
