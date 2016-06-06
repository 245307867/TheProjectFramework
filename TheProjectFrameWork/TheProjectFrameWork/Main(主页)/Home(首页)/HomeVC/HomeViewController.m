//
//  HomeViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HometableHeadView.h"
#import "SDCycleScrollView.h"
static NSString * cellIdentifier = @"HomeTableViewCell";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
/** 首页表格 */
@property(strong,nonatomic)UITableView * homeTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBtnNavBarButton];
    [self loadHeadView];
    // Do any additional setup after loading the view.
}

/**
 *  加载头部视图
 */
-(void)loadHeadView{
    NSArray *imagesURLStrings = @[
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1402/221/421883372/88115/8cc2231a/55815835N35a44559.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t976/208/1221678737/91179/5d7143d5/5588e849Na2c20c1a.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t805/241/1199341035/289354/8648fe55/5581211eN7a2ebb8a.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1606/199/444346922/48930/355f9ef/55841cd0N92d9fa7c.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1609/58/409100493/49144/7055bec5/557e76bfNc065aeaf.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t895/234/1192509025/111466/512174ab/557fed56N3e023b70.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t835/313/1196724882/359493/b53c7b70/5581392cNa08ff0a9.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t898/15/1262262696/95281/57d1f12f/558baeb4Nbfd44d3a.jpg"
                                  ];
    // 网络加载 --- 创建不带标题的图片轮播器
    SDCycleScrollView * imagePlayerScrollerView  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,-64, KScreenBoundWidth, 180) imageURLStringsGroup:nil];
    imagePlayerScrollerView.infiniteLoop = YES;
    imagePlayerScrollerView.delegate = self;
    imagePlayerScrollerView.placeholderImage=[UIImage imageNamed:@"cell_00"];
    imagePlayerScrollerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    imagePlayerScrollerView.autoScrollTimeInterval = 2.0; // 轮播时间间隔，默认1.0秒，可自定义
    imagePlayerScrollerView.imageURLStringsGroup = imagesURLStrings;
    self.homeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    self.homeTableView.backgroundColor = [UIColor clearColor];
    self.homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.homeTableView setTableHeaderView:imagePlayerScrollerView];
    [self.view addSubview:self.homeTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

/**
 *  设置navigationBar
 */
- (void)addBtnNavBarButton{

    CGRect barRect = self.navigationController.navigationBar.bounds;
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setFrame:CGRectMake(0, 0, barRect.size.height, barRect.size.height)];
    leftbutton.layer.masksToBounds = YES;
    leftbutton.layer.cornerRadius = barRect.size.height/2.0;
    [leftbutton setImage:[UIImage imageNamed:@"ico_camera_7"] forState:UIControlStateNormal];
    [leftbutton setBackgroundColor:[UIColor clearColor]];
    [leftbutton addTarget:self action:@selector(scanthecode) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = leftitem;
    
    UIButton *rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightbutton setFrame:CGRectMake(0, 0, barRect.size.height, barRect.size.height)];
    rightbutton.layer.masksToBounds = YES;
    rightbutton.layer.cornerRadius = barRect.size.height/2.0;
    [rightbutton setImage:[UIImage imageNamed:@"HomePage_Message"] forState:UIControlStateNormal];
    [rightbutton setBackgroundColor:[UIColor clearColor]];
    [rightbutton addTarget:self action:@selector(sendMessgae) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
    self.navigationItem.rightBarButtonItem = rightitem;
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0]];
}
-(void)setTypeNavigationBar{
    CGRect barRect = self.navigationController.navigationBar.bounds;
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setFrame:CGRectMake(0, 0, barRect.size.height, barRect.size.height)];
    leftbutton.layer.masksToBounds = YES;
    leftbutton.layer.cornerRadius = barRect.size.height/2.0;
    [leftbutton setImage:[UIImage imageNamed:@"ico_camera_7_gray"] forState:UIControlStateNormal];
    [leftbutton setBackgroundColor:[UIColor clearColor]];
    [leftbutton addTarget:self action:@selector(scanthecode) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = leftitem;
    
    UIButton *rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightbutton setFrame:CGRectMake(0, 0, barRect.size.height, barRect.size.height)];
    rightbutton.layer.masksToBounds = YES;
    rightbutton.layer.cornerRadius = barRect.size.height/2.0;
    [rightbutton setImage:[UIImage imageNamed:@"my_message_btn_n"] forState:UIControlStateNormal];
    [rightbutton setBackgroundColor:[UIColor clearColor]];
    [rightbutton addTarget:self action:@selector(sendMessgae) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
    self.navigationItem.rightBarButtonItem = rightitem;
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:1]];
}
/**
 *  扫描二维码
 */
-(void)scanthecode{
    
}
/**
 *  发送消息
 */
-(void)sendMessgae{
    
}


#pragma mark --ImagePlayerViewDelegate
-(NSInteger)numberOfItems{
    return 6;
}
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index{
    NSString * image = [NSString stringWithFormat:@"cell_0%ld",index+1];
    imageView.image =[UIImage imageNamed:image];
}
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index{
    
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
}

- (void)indexOnPageControl:(NSInteger)index{
    
}


#pragma mark --UITableViewDelegate&&UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil] firstObject];
    }
    cell.homeCellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"cell_0%ld",(long)indexPath.row+1]];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return KScreenBoundHeight;
}
#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(self.homeTableView.contentOffset.y>200) {
        [self setTypeNavigationBar];
    }
    else
    {
        [self addBtnNavBarButton];
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
