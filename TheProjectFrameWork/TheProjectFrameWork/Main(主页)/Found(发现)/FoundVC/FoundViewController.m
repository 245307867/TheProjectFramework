//
//  FoundViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/5.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "FoundViewController.h"
#import "FoundTableViewCell.h"
#import "FoundCollectionViewCell.h"
#import "SearchViewController.h"
#import "GoodsDetialViewController.h"
#import "ShoppingModel.h"
#import "LBXScanViewStyle.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SubLBXScanViewController.h"

static NSString * cellIdentifier = @"FoundTableViewCell";
static NSString * itemIdentifier = @"FoundCollectionViewCell";
@interface FoundViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate>

/** headView 高度 */
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHeight;
/** 顶部高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topToSuperView;
/** 发现头部视图 */
@property (weak, nonatomic) IBOutlet UIView *foundheadView;
/** 发现头部collectionView */
@property (weak, nonatomic) IBOutlet UICollectionView *foundheadCollectionView;
/** 发现详情 */
@property (weak, nonatomic) IBOutlet UITableView *foundDetailTableView;
/** 测试数据数组 */
@property(strong,nonatomic) NSMutableArray * testDataArray;
/** 搜索bar */
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNavigationBar];
    [self loadDataSource];


    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;

}

/**
 *  加载navigationBar
 */
-(void)loadNavigationBar{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ico_camera_7_gray"] style:UIBarButtonItemStyleDone target:self action:@selector(scanthecode)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"HomePage_Message"] style:UIBarButtonItemStyleDone target:self action:@selector(sendMessgae)];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow.png"] forBarMetrics:UIBarMetricsDefault];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.searchBar.delegate = self;
    self.foundheadCollectionView.showsHorizontalScrollIndicator = NO;

}


/**
 *  加载数据源
 */
-(void)loadDataSource{
    self.testDataArray = [NSMutableArray array];
    [self.foundheadCollectionView registerNib:[UINib nibWithNibName:itemIdentifier bundle:nil] forCellWithReuseIdentifier:itemIdentifier];
    NSArray * array =@[@"wait_money_icon",@"wait_product_icon",@"wait_comment_icon",@"wait_after_icon",@"my_privilege_icon"];
    [self.testDataArray addObjectsFromArray:array];
}
#pragma mark--UITableViewDataSource &&UITableViewDelegate 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FoundTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle ]loadNibNamed:cellIdentifier owner:nil options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.foundCellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetialViewController * detialView = [[GoodsDetialViewController alloc] init];
    ShoppingModel * model = [[ShoppingModel alloc] init];
    model.goodsImageUrl =[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row];
    model.goodsPrices = KArc4andomPrices;
    model.goodsId = [NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row];
    model.goodsDescription = @"这是什么什么商品";
    detialView.goodsmodel = model;
    self.tabBarController.tabBar.hidden=YES;
    [self.navigationController pushViewController:detialView animated:YES];

}
#pragma mark --UICollectionViewDelegate &&UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FoundCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemIdentifier forIndexPath:indexPath];
    cell.foundHeadImageView.image = [UIImage imageNamed:self.testDataArray[indexPath.row]];
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width/5, collectionView.frame.size.height);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

#pragma mark --UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    SearchViewController * search = [[SearchViewController alloc] init];
    [UIView animateWithDuration:1 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        self.view.alpha = 1;
    }];
    [self presentViewController:search animated:NO completion:^{
    }];
    return YES;
}

#pragma mark--publish
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
