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

static NSString * cellIdentifier = @"FoundTableViewCell";
static NSString * itemIdentifier = @"FoundCollectionViewCell";
@interface FoundViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate,UISearchDisplayDelegate>

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
/** 测试数据数组 */
@property(strong,nonatomic) NSMutableArray * testDataArray;
/** 搜索bar */
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNavagationBar];
    [self loadDataSource];


    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadNavagationBar{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ico_camera_7_gray"] style:UIBarButtonItemStyleDone target:self action:@selector(scanthecode)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"HomePage_Message"] style:UIBarButtonItemStyleDone target:self action:@selector(sendMessgae)];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow.png"] forBarMetrics:UIBarMetricsDefault];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.searchBar.delegate = self;

}
-(void)scanthecode{
    
}
-(void)sendMessgae{
    
}
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
    if (self.foundDetailTableView.contentOffset.y > 208) {
        self.headViewHeight.constant = 308-self.foundDetailTableView.contentOffset.y;
        [self viewIfLoaded];
    }
    if (self.foundDetailTableView.contentOffset.y<208) {
        self.headViewHeight.constant =100;
        [self viewIfLoaded];
    }

}

#pragma mark --

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    SearchViewController * search = [[SearchViewController alloc] init];
    CATransition * animation = [CATransition animation];
    
    animation.duration = 1;    //  时间
    /**  type：动画类型
     *  pageCurl       向上翻一页
     *  pageUnCurl     向下翻一页
     *  rippleEffect   水滴
     *  suckEffect     收缩
     *  cube           方块
     *  oglFlip        上下翻转
     */
    animation.type = @"suckEffect";
    
    /**  type：页面转换类型
     *  kCATransitionFade       淡出
     *  kCATransitionMoveIn     覆盖
     *  kCATransitionReveal     底部显示
     *  kCATransitionPush       推出
     */
    animation.type = kCATransitionFade;
    
    //PS：type 更多效果请 搜索： CATransition
    
    /**  subtype：出现的方向
     *  kCATransitionFromRight       右
     *  kCATransitionFromLeft        左
     *  kCATransitionFromTop         上
     *  kCATransitionFromBottom      下
     */
    animation.subtype = kCATransitionFromTop;
    
    [self.view.window.layer addAnimation:animation forKey:nil];                   //  添加动作
    [self presentViewController:search animated:NO completion:^{
        
    }];
    return YES;
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
