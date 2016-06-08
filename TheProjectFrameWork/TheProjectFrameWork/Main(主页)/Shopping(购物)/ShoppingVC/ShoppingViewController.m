//
//  ShoppingViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ShoppingViewController.h"
#import "ShoppingCartTableViewCell.h"
#import "ShopPingCart.h"
#import "ShoppingModel.h"

static NSString * cellIdentifier = @"ShoppingCartTableViewCell";
@interface ShoppingViewController ()<UITableViewDelegate,UITableViewDataSource,ShoppingCartTableViewCellDelegate>
/** 购物车列表 */
@property (weak, nonatomic) IBOutlet UITableView *shoppingCartTableView;
/** 数据列表 */
@property(strong,nonatomic) NSMutableArray * dataArray;
/** 选择所有 */
@property (weak, nonatomic) IBOutlet UIButton *selectedAllButtn;
/** 合计价格 */
@property (weak, nonatomic) IBOutlet UILabel *totalPricesLabel;
/** 总额 */
@property (weak, nonatomic) IBOutlet UILabel *allPricesLabel;
/** 支付按钮 */
@property (weak, nonatomic) IBOutlet UIButton *payForButton;

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadDatasource];
}
-(void)loadDatasource{
    [self.payForButton setTitle:[NSString stringWithFormat:@"去结算(%ld)",[[ShopPingCart ShareShopping] allGoodsNumber]] forState:UIControlStateNormal];
    self.allPricesLabel.text = [NSString stringWithFormat:@"总额：￥%@",[[ShopPingCart ShareShopping] allGoodPrices]];
    self.totalPricesLabel.text = [NSString stringWithFormat:@"合计：￥%@",[[ShopPingCart ShareShopping] allGoodPrices]];
    self.dataArray = [NSMutableArray array];
    NSArray * array = [[ShopPingCart ShareShopping] Shoppinglist];
    [self.dataArray addObjectsFromArray:array];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.shoppingCartTableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    ShoppingModel * model = self.dataArray[indexPath.row];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil] firstObject];
    }
    cell.delegate = self;
    [cell goodsLoadShoppingCartWithModel:model andIndexPath:indexPath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark --ShoppingCartTableViewCellDelegate
-(void)goodsNumberChangeedWith:(ShoppingModel*)goodsmodel withIndexPath:(NSIndexPath*)indexPath
{
    [self.payForButton setTitle:[NSString stringWithFormat:@"去结算(%ld)",[[ShopPingCart ShareShopping] allGoodsNumber]] forState:UIControlStateNormal];
    self.allPricesLabel.text = [NSString stringWithFormat:@"总额：￥%@",[[ShopPingCart ShareShopping] allGoodPrices]];
    self.totalPricesLabel.text = [NSString stringWithFormat:@"合计：￥%@",[[ShopPingCart ShareShopping] allGoodPrices]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
