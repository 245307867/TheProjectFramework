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

static NSString * cellIdentifier = @"FoundTableViewCell";
static NSString * itemIdentifier = @"FoundCollectionViewCell";
@interface FoundViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/** headView 高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHeight;
/** 顶部高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topToSuperView;
/** 发现头部视图 */
@property (weak, nonatomic) IBOutlet UIView *foundheadView;
/** 发现头部collectionView */
@property (weak, nonatomic) IBOutlet UICollectionView *foundheadCollectionView;
/** 发现详情 */
@property (weak, nonatomic) IBOutlet UITableView *foundDetailTableView;
@property(strong,nonatomic) NSMutableArray * testDataArray;

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.testDataArray = [NSMutableArray array];
    [self.foundheadCollectionView registerNib:[UINib nibWithNibName:itemIdentifier bundle:nil] forCellWithReuseIdentifier:itemIdentifier];
    NSArray * array =@[@"wait_money_icon",@"wait_product_icon",@"wait_comment_icon",@"wait_after_icon",@"my_privilege_icon"];
    [self.testDataArray addObjectsFromArray:array];

    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.foundCellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MENU_0_0_%ld",indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
#pragma mark --UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.foundDetailTableView.contentOffset.y > 108) {
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView animateWithDuration:5 animations:^{
            self.headViewHeight.constant = 208-self.foundDetailTableView.contentOffset.y;
            [self viewIfLoaded];
        } completion:^(BOOL finished) {
            
        }];
    }
    if (self.foundDetailTableView.contentOffset.y<108) {
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView animateWithDuration:5 animations:^{
            self.headViewHeight.constant =100;
            [self viewIfLoaded];
        } completion:^(BOOL finished) {
            
        }];
    }

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
