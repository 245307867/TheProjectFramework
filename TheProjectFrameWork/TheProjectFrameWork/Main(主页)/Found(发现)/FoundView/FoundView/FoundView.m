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
    if (array.count) {
        [self.tableviewDataArray removeAllObjects];
    }
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
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.backgroundColor = KArc4andomColor;
    cell.foundCellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row]];
    return cell;

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(FoundViewtabelViewSelected:WithIndexPath:)]) {
        [self.delegate FoundViewtabelViewSelected:self WithIndexPath:indexPath];
    }
}
#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
        if ([self.delegate respondsToSelector:@selector(FoundViewtabelViewScrolled:withScrollerView:)]) {
            [self.delegate FoundViewtabelViewScrolled:self withScrollerView:scrollView];
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
