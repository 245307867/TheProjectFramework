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
@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
/** 搜索bar */
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
/** 取消button */
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
/** 语音输入button */
@property (weak, nonatomic) IBOutlet UIButton *voiceInputButton;
/** 搜索TableView */
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
/** 数组元素 */
@property(strong,nonatomic) NSMutableArray * dataArray;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    [self.searchBar becomeFirstResponder];
    self.searchBar.delegate = self ;
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)cancelButtonClicked:(UIButton *)sender {
    [UIView animateWithDuration:1 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        self.view.alpha =1;
    }];
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
#pragma mark --UITableViewDelegate&&UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenfier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdenfier owner:nil options:nil] firstObject];
    }
    cell.searchResultLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark --UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length) {
        self.voiceInputButton.alpha = 0;
        [self.dataArray addObject:searchText];
        [self.searchTableView reloadData];
    }
    else{
        self.voiceInputButton.alpha = 1;
        [self.dataArray removeAllObjects];
        [self.searchTableView reloadData];
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
