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
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.tintColor = nil;
    self.navigationController.navigationBar. alpha = 0;
    self.navigationController.navigationBar.translucent = NO;
    
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
    SDCycleScrollView * imagePlayerScrollerView  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenBoundWidth, 180) imageURLStringsGroup:nil];
    imagePlayerScrollerView.infiniteLoop = YES;
    imagePlayerScrollerView.delegate = self;
    imagePlayerScrollerView.placeholderImage=[UIImage imageNamed:@"cell_00"];
    imagePlayerScrollerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    imagePlayerScrollerView.autoScrollTimeInterval = 2.0; // 轮播时间间隔，默认1.0秒，可自定义
    imagePlayerScrollerView.imageURLStringsGroup = imagesURLStrings;
    [self.homeTableView setTableHeaderView:imagePlayerScrollerView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];


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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
