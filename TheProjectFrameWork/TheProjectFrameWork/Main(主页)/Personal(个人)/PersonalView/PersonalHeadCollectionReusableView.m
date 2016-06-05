//
//  PersonalHeadCollectionReusableView.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "PersonalHeadCollectionReusableView.h"

@implementation PersonalHeadCollectionReusableView

- (void)awakeFromNib {
    // Initialization code
}
-(void)personalWithsection:(NSInteger)section{
    self.section =section;
}
/**
 *  登陆按钮点击
 *
 *  @param sender <#sender description#>
 */
- (IBAction)loginButtonClicked:(UIButton *)sender {
    [self.delegate PersonalHeadCollectionReusableViewHeadClickedWithIndex:self.section];
}

@end
