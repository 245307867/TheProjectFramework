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
@interface ShoppingViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 购物车列表 */
@property (weak, nonatomic) IBOutlet UITableView *shoppingCartTableView;
@property(strong,nonatomic) NSMutableArray * dataArray;
@property (weak, nonatomic) IBOutlet UIButton *selectedAllButtn;
@property (weak, nonatomic) IBOutlet UILabel *totalPricesLabel;
@property (weak, nonatomic) IBOutlet UILabel *allPricesLabel;
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
    [cell goodsLoadShoppingCartWithModel:model andIndexPath:indexPath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
