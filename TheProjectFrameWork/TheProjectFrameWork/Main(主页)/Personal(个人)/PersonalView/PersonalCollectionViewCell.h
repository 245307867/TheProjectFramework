//
//  PersonalCollectionViewCell.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCollectionViewCell : UICollectionViewCell
/** 内容详情 */
@property (weak, nonatomic) IBOutlet UILabel *contentDetialLabel;
/** 内容logo */
@property (weak, nonatomic) IBOutlet UIImageView *contentLogoImageView;

@end
