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
@property (weak, nonatomic) IBOutlet UIView *shoppingView;
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

    self.dataArray = [NSMutableArray array];
    NSArray * array = [[ShopPingCart ShareShopping] Shoppinglist];
    if (array.count) {
        self.shoppingView.alpha = 1;
        [self.payForButton setTitle:[NSString stringWithFormat:@"去结算(%ld)",[[ShopPingCart ShareShopping] allGoodsNumber]] forState:UIControlStateNormal];
        self.allPricesLabel.text = [NSString stringWithFormat:@"总额：￥%@",[[ShopPingCart ShareShopping] allGoodPrices]];
        self.totalPricesLabel.text = [NSString stringWithFormat:@"合计：￥%@",[[ShopPingCart ShareShopping] allGoodPrices]];
    }
    else{
        self.shoppingView.alpha = 0;

    }
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell goodsLoadShoppingCartWithModel:model andIndexPath:indexPath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
// 设置 哪一行的编辑按钮 状态 指定编辑样式
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        ShoppingModel * model =self.dataArray[indexPath.row];
        [[ShopPingCart ShareShopping] goodsRemoveFromeShoppingCartWithModel:model];
        [self loadDatasource];
        //title可自已定义
    NSLog(@"点击删除");
    }];
    //此处是iOS8.0以后苹果最新推出的api，UITableViewRowAction，Style是划出的标签颜色等状态的定义，这里也可自行定义
    UITableViewRowAction * editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"关注" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击关注");
    }];
    editRowAction.backgroundColor = [UIColor lightGrayColor];//可以定义RowAction的颜色
    return @[deleteRoWAction, editRowAction];
    
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
