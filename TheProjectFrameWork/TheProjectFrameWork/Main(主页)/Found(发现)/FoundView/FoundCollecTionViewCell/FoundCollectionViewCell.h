//
//  FoundCollectionViewCell.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/5.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundCollectionViewCell : UICollectionViewCell
/** 发现头部图片 */
@property (weak, nonatomic) IBOutlet UIImageView *foundHeadImageView;
/** 发现头部描述 */
@property (weak, nonatomic) IBOutlet UILabel *foundHeadContentLabel;

@end
