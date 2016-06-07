//
//  SearchViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/7.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"
static NSString * cellIdenfier =@"SearchTableViewCell";
@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 搜索bar */
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
/** 取消button */
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
/** 语音输入button */
@property (weak, nonatomic) IBOutlet UIButton *voiceInputButton;
/** 搜索TableView */
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonClicked:(UIButton *)sender {
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
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
#pragma mark --UITableViewDelegate&&UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenfier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdenfier owner:nil options:nil] firstObject];
    }
    return cell;
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
