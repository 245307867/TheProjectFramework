//
//  FoundViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/5.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "FoundViewController.h"
#import "FoundCollectionViewCell.h"
#import "SearchViewController.h"
#import "GoodsDetialViewController.h"
#import "ShoppingModel.h"
#import "LBXScanViewStyle.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SubLBXScanViewController.h"
#import "FoundView.h"

static NSString * itemIdentifier = @"FoundCollectionViewCell";
@interface FoundViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate,UIScrollViewDelegate,FoundViewDelegate>

/** headView 高度 */
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHeight;
/** 顶部高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topToSuperView;
/** 发现头部视图 */
@property (weak, nonatomic) IBOutlet UIView *foundheadView;
/** 发现头部collectionView */
@property (weak, nonatomic) IBOutlet UICollectionView *foundheadCollectionView;
/** 测试数据数组 */
@property(strong,nonatomic) NSMutableArray * testDataArray;
/** 搜索bar */
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
/** 发现scrollView */
@property (weak, nonatomic) IBOutlet UIScrollView *foundDetialscrollView;

@end

@implementation FoundViewController
{
    BOOL isCollectionViewScroll;
}
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
    NSArray * array =@[@"wait_money_icon",@"wait_product_icon",@"wait_comment_icon",@"wait_after_icon",@"my_privilege_icon",@"wait_money_icon",@"wait_product_icon",@"wait_comment_icon",@"wait_after_icon",@"my_privilege_icon"];
    for (NSInteger m = 0; m<array.count; m++) {
      FoundView *  foundView= [FoundView createFoundView];
        foundView.tag = 1000+m;
        foundView.delegate = self;
        [foundView loadDataSourceWithArray:array];
        foundView.frame = CGRectMake(m*self.view.frame.size.width, 0, self.foundDetialscrollView.frame.size.width, self.foundDetialscrollView.frame.size.height);
        [self.foundDetialscrollView addSubview:foundView];
    }
    self.foundDetialscrollView.scrollEnabled = YES;
//    self.foundheadCollectionView.backgroundColor = [UIColor blackColor];
    //设置在拖拽的时候是否锁定其在水平或者垂直的方向
    self.foundDetialscrollView.showsHorizontalScrollIndicator = YES;
    self.foundDetialscrollView.contentSize = CGSizeMake(self.view.frame.size.width*array.count, 0);
    self.foundDetialscrollView.pagingEnabled = YES;
    self.foundDetialscrollView.delegate = self;
    [self.testDataArray addObjectsFromArray:array];
}
#pragma mark --UICollectionViewDelegate &&UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FoundCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemIdentifier forIndexPath:indexPath];
    UIView * view = [[UIView alloc] init];
    UIView * views = [UIView new];
    views.frame = CGRectMake(0, cell.frame.size.height-5, cell.frame.size.width, 2);
    views.backgroundColor = [UIColor redColor];
    [view addSubview:views];
    cell.selectedBackgroundView = view;
    cell.foundHeadImageView.image = [UIImage imageNamed:self.testDataArray[indexPath.row]];
    cell.foundHeadContentLabel.highlightedTextColor = KArc4andomColor;
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width/5, collectionView.frame.size.height);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    isCollectionViewScroll = YES;
    [self.foundheadCollectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [self.foundDetialscrollView setContentOffset:CGPointMake(self.foundDetialscrollView.frame.size.width*indexPath.row,0) animated:YES];

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
#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    isCollectionViewScroll = NO;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView==self.foundDetialscrollView&&!isCollectionViewScroll) {
        NSInteger m = scrollView.contentOffset.x/scrollView.frame.size.width;
        NSIndexPath * indexpath = [NSIndexPath indexPathForRow:m inSection:0];
        [self.foundheadCollectionView selectItemAtIndexPath:indexpath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    }
    if (scrollView==self.foundheadCollectionView) {
        
    }
    
}

#pragma mark --FoundViewDelegate
-(void)FoundViewtabelViewScrolled:(FoundView *)foundview{
    NSLog(@"%@--",foundview);
}
-(void)FoundViewtabelViewSelected:(FoundView *)foundview WithIndexPath:(NSIndexPath *)indexpath{
    NSLog(@"foundView %@  ===%@",foundview,indexpath);
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

@end
