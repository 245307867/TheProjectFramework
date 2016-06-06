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
#import "ClassificationTitleView.h"

/** MenuCell  */
static NSString * cellIdentifier = @"ClassficationMenuTableViewCell";
/** DefaultItem */
static NSString * itemIndetifier = @"ClassficationDetailCollectionViewCell";
/** RecommendedHeadView */
static NSString * headViewRecommendedIndetifier = @"ClassfiactionHeadTypeImageCollectionReusableView";
/** HeadView */
static NSString * headViewIndentifier = @"ClassficationHeadCollectionReusableView";

@interface ClassificationViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ClassficationHeadCollectionReusableViewDelegate,ClassificationTitleViewDelegate>
/** 菜单列表tableView */
@property (weak, nonatomic) IBOutlet UITableView *classficationMenutableView;
/** 详情collectionView */
@property (weak, nonatomic) IBOutlet UICollectionView *classficationDetailCollectionView;

@end

@implementation ClassificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCollectionView];
    [self loadNavagationBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  加载导航栏
 */
-(void)loadNavagationBar{
    ClassificationTitleView * view =[ClassificationTitleView TitleViewCreatWithFrame:CGRectMake(0, 0, KScreenBoundWidth-10, 40)];
    view.delegate = self;
    self.navigationItem.titleView = view;
}
/**
 *  注册collectionView
 */

-(void)registerCollectionView{
    self.classficationMenutableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.classficationDetailCollectionView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15];
    self.classficationDetailCollectionView.backgroundView.backgroundColor  = [UIColor whiteColor];
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
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ClassficationDetailCollectionViewCell * item = [collectionView dequeueReusableCellWithReuseIdentifier:itemIndetifier forIndexPath:indexPath];
    item.detialImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row]];
    item.detialContentLabel.textColor = KArc4andomColor;
    item.detialContentLabel.text = @"测试详情";
    return item;
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
            return headView;
            
        }

        
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
            return CGSizeMake(collectionView.frame.size.width/4, 100);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section) {
        return CGSizeMake(self.classficationDetailCollectionView.frame.size.width, 40);
    }
    else{
        return CGSizeMake(self.classficationDetailCollectionView.frame.size.width, 100);;
    }
}

#pragma mark --ClassficationHeadCollectionReusableViewDelegate
-(void)ClassficationHeadCollectionReusableViewDeatialistClickWithseciton:(NSInteger)section{
    NSLog(@"%ld",(long)section);
}

#pragma mark --ClassificationTitleViewDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}




@end
