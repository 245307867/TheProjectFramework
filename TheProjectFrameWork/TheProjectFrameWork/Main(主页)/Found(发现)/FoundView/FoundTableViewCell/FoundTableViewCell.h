//
//  FoundTableViewCell.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/5.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundTableViewCell : UITableViewCell
/** 图片 */
@property (weak, nonatomic) IBOutlet UIImageView *foundCellImageView;
/** 内容描述 */
@property (weak, nonatomic) IBOutlet UILabel *foundContentLabel;

@end
