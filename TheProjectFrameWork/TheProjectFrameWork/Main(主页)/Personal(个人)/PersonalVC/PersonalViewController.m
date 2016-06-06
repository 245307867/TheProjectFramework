//
//  PersonalViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalCollectionViewCell.h"
#import "PersonalHeadCollectionReusableView.h"
#import "LoginViewController.h"
#define KCollectionViewItemmCount 5
#define KCollectionItemHegiht 100

static NSString * PersonalCollectionViewIdentifier = @"PersonalCollectionViewCell";
static NSString * PersonalCollectionViewHeadIndetifier = @"PersonalHeadCollectionReusableView";
@interface PersonalViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PersonalHeadCollectionReusableViewDelegate>
/** 个人collectionView*/
@property (weak, nonatomic) IBOutlet UICollectionView *personalCenterCollectionView;
/** 存储图片 */
@property (strong, nonatomic)  NSMutableArray *dataArray;
/** 存储名字 */
@property (strong, nonatomic)  NSMutableArray *testContentDataArray;

@end
@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataSource];
    [self personalCollectionViewRegister];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/**
 *  注册collectionView
 */
-(void)personalCollectionViewRegister{
    //设置collectionView可以滚动
    self.personalCenterCollectionView.alwaysBounceVertical = YES;
    UINib * nib = [UINib nibWithNibName:PersonalCollectionViewIdentifier bundle:[NSBundle mainBundle]];
    [self.personalCenterCollectionView registerNib:nib forCellWithReuseIdentifier:PersonalCollectionViewIdentifier];
    [self.personalCenterCollectionView registerNib:[UINib nibWithNibName:PersonalCollectionViewHeadIndetifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:PersonalCollectionViewHeadIndetifier];
    [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0]];

}
/**
 *  设置数据源
 */
-(void)loadDataSource{
    self.dataArray = [NSMutableArray array];
    self.testContentDataArray  =[NSMutableArray array];
    NSArray * array =@[@"wait_money_icon",@"wait_product_icon",@"wait_comment_icon",@"wait_after_icon",@"my_privilege_icon"];
    NSArray * nameArray = @[@"待付款",@"待收货",@"待评价",@"返修/退货",@"我的订单"];
    [self.testContentDataArray addObjectsFromArray:nameArray];
    [self.dataArray addObjectsFromArray:array];
    
    
}
#pragma mark --UICollectionViewDelegate &&UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return KCollectionViewItemmCount;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PersonalCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:PersonalCollectionViewIdentifier forIndexPath:indexPath];
    cell.contentLogoImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    cell.contentDetialLabel.text = self.testContentDataArray[indexPath.row];
    return cell;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
        return CGSizeMake(collectionView.frame.size.width/5, KPersonalCollectionViewCellHeight);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section) {
        return CGSizeZero;
    }
    else{
        return CGSizeMake(KScreenBoundWidth, KCollectionItemHegiht);
    }
}
//TODO: collectionView 区头视图 区尾视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
        PersonalHeadCollectionReusableView * headerView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:PersonalCollectionViewHeadIndetifier forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor blueColor];
        headerView.delegate =self;
        headerView.frame = CGRectMake(0, -64, KScreenBoundWidth, 200);
        [headerView personalWithsection:indexPath.section];
        return headerView;
    }
    else{
        return nil;
    }
}

#pragma mark ---PersonalHeadCollectionReusableViewDelegate
-(void)PersonalHeadCollectionReusableViewHeadClickedWithIndex:(NSInteger)section{
    UIStoryboard * loginStoryBoard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    [self presentViewController:loginStoryBoard.instantiateInitialViewController animated:YES completion:^{
    }];
}



@end
