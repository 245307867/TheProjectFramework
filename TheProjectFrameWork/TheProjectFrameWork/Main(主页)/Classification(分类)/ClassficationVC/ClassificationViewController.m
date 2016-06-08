//
//  ClassificationViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/4.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ClassificationViewController.h"
#import "ClassficationMenuTableViewCell.h"
#import "ClassficationDetailCollectionViewCell.h"
#import "ClassficationHeadCollectionReusableView.h"
#import "ClassfiactionHeadTypeImageCollectionReusableView.h"
#import "GoodsDetialViewController.h"
#import "ShoppingModel.h"

/** MenuCell  */
static NSString * cellIdentifier = @"ClassficationMenuTableViewCell";
/** DefaultItem */
static NSString * itemIndetifier = @"ClassficationDetailCollectionViewCell";
/** RecommendedHeadView */
static NSString * headViewRecommendedIndetifier = @"ClassfiactionHeadTypeImageCollectionReusableView";
/** HeadView */
static NSString * headViewIndentifier = @"ClassficationHeadCollectionReusableView";

@interface ClassificationViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ClassficationHeadCollectionReusableViewDelegate,ClassfiactionHeadTypeImageCollectionReusableViewDelegate>
/** 菜单列表tableView */
@property (weak, nonatomic) IBOutlet UITableView *classficationMenutableView;
/** 详情collectionView */
@property (weak, nonatomic) IBOutlet UICollectionView *classficationDetailCollectionView;

@end

@implementation ClassificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden =NO;
    [self registerCollectionView];

}

/**
 *  注册collectionView
 */

-(void)registerCollectionView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.classficationMenutableView.backgroundColor = [UIColor clearColor];
    self.classficationDetailCollectionView.backgroundColor = [UIColor clearColor];
    self.classficationDetailCollectionView.backgroundView.backgroundColor  = [UIColor clearColor];
    //注册collectionViewCell
    [self.classficationDetailCollectionView registerNib:[UINib nibWithNibName:itemIndetifier bundle:nil] forCellWithReuseIdentifier:itemIndetifier];
    //注册collectionViewCellHeadViewTypeImage
    [self.classficationDetailCollectionView registerNib:[UINib nibWithNibName:headViewRecommendedIndetifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headViewRecommendedIndetifier];
    //注册collectionViewCellHeadView
    [self.classficationDetailCollectionView registerNib:[UINib nibWithNibName:headViewIndentifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headViewIndentifier];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}


#pragma mark --UITableViewDelegate&&UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ClassficationMenuTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil] firstObject];
    }
    cell.menuContentLabel.text = @"测试内容";
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.menuContentLabel.highlightedTextColor = [UIColor redColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.classficationDetailCollectionView reloadData];
}

#pragma mark--UICollectionViewDataSource&&UICollectionViewDelegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ClassficationDetailCollectionViewCell * item = [collectionView dequeueReusableCellWithReuseIdentifier:itemIndetifier forIndexPath:indexPath];
    item.detialImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row]];
    item.detialContentLabel.textColor = KArc4andomColor;
    item.detialContentLabel.text = @"测试详情";
    return item;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetialViewController *detialVC = [[GoodsDetialViewController alloc] init];
    ShoppingModel * model = [ShoppingModel new];
    model.goodsName = [NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row];
    model.goodsImageUrl = [NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row];
    model.goodsId =[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row];
    model.goodsDescription = @"详细描述是什么";
    model.goodsPrices = KArc4andomPrices;
    detialVC.goodsmodel = model;
    self.tabBarController.tabBar.hidden =YES;
    [self.navigationController pushViewController:detialVC animated:YES];
    
}
#pragma mark--UICollectionViewDelegateFlowLayout

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"])
    {
        if (indexPath.section) {
            ClassficationHeadCollectionReusableView * headerView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headViewIndentifier forIndexPath:indexPath];
            [headerView loadClassficationHeadViewWithSection:indexPath.section];
            headerView.delegate = self;
            return headerView;
        }
        else{
            ClassfiactionHeadTypeImageCollectionReusableView * headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headViewRecommendedIndetifier forIndexPath:indexPath];
            [headView loadRecommendImageViewModel:nil WithIndex:indexPath];
            headView.delegate = self;
            return headView;
            
        }

        
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
            return CGSizeMake(collectionView.frame.size.width/3, 100);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section) {
        return CGSizeMake(self.classficationDetailCollectionView.frame.size.width, 40);
    }
    else{
        return CGSizeMake(self.classficationDetailCollectionView.frame.size.width, 140);;
    }
}

#pragma mark --ClassficationHeadCollectionReusableViewDelegate
-(void)ClassficationHeadCollectionReusableViewDeatialistClickWithseciton:(NSInteger)section{
    GoodsDetialViewController *detialVC = [[GoodsDetialViewController alloc] init];
    ShoppingModel * model = [ShoppingModel new];
    model.goodsName = [NSString stringWithFormat:@"MENU_0_0_%ld",section];
    model.goodsImageUrl = [NSString stringWithFormat:@"MENU_0_0_%ld",section];
    model.goodsId =[NSString stringWithFormat:@"MENU_0_0_%ld",section];
    model.goodsDescription = @"详细描述是什么";
    model.goodsPrices = KArc4andomPrices;
    detialVC.goodsmodel = model;
    self.tabBarController.tabBar.hidden =YES;
    [self.navigationController pushViewController:detialVC animated:YES];
}
#pragma mark -ClassfiactionHeadTypeImageCollectionReusableViewDelegate
-(void)ClassfiactionHeadTypeImageCollectionReusableViewClickedWithindexPath:(NSIndexPath *)index
{
    GoodsDetialViewController *detialVC = [[GoodsDetialViewController alloc] init];
    ShoppingModel * model = [ShoppingModel new];
    model.goodsName = [NSString stringWithFormat:@"MENU_0_0_%ld",index.section];
    model.goodsImageUrl = [NSString stringWithFormat:@"MENU_0_0_%ld",index.section];
    model.goodsDescription = @"详细描述是什么";
    model.goodsId =[NSString stringWithFormat:@"MENU_0_0_%ld",index.section];
    model.goodsPrices = KArc4andomPrices;
    detialVC.goodsmodel = model;
    self.tabBarController.tabBar.hidden =YES;
    [self.navigationController pushViewController:detialVC animated:YES];

}




@end
