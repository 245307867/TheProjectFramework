//
//  FoundView.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/14.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "FoundView.h"
#import "FoundTableViewCell.h"
#import "GoodsDetialViewController.h"
#import "ShoppingModel.h"
static NSString * cellIdentifier = @"FoundTableViewCell";

@interface FoundView ()<UITableViewDelegate,UITableViewDataSource>

@end



@implementation FoundView

+(FoundView*)createFoundView{
    FoundView * view = [[[NSBundle mainBundle] loadNibNamed:@"FoundView" owner:self options:nil] firstObject];
    view.foundTableView.dataSource = view;
    view.foundTableView.delegate = view;
    view.tableviewDataArray = [NSMutableArray arrayWithCapacity:4];
    view.backgroundColor = KArc4andomColor;
    view.frame = kScreenFreameBound;
    return view;
}
-(void)loadDataSourceWithArray:(NSArray*)array
{
    [self.tableviewDataArray addObjectsFromArray:array];
    [self.foundTableView reloadData];
}

#pragma mark --UITableViewDelegate && UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableviewDataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FoundTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle ]loadNibNamed:cellIdentifier owner:nil options:nil] firstObject];
    }
    cell.backgroundColor = KArc4andomColor;
    cell.foundCellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row]];
    return cell;

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    GoodsDetialViewController * detialView = [[GoodsDetialViewController alloc] init];
//    ShoppingModel * model = [[ShoppingModel alloc] init];
//    model.goodsImageUrl =[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row];
//    model.goodsPrices = KArc4andomPrices;
//    model.goodsId = [NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row];
//    model.goodsDescription = @"这是什么什么商品";
//    detialView.goodsmodel = model;
//    self.tabBarController.tabBar.hidden=YES;
//    [self.navigationController pushViewController:detialView animated:YES];
    
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(FoundViewtabelViewSelected:WithIndexPath:)]) {
        [self.delegate FoundViewtabelViewSelected:self WithIndexPath:indexPath];
    }
}
#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(FoundViewtabelViewScrolled:)]) {
        [self.delegate FoundViewtabelViewScrolled:self];
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
