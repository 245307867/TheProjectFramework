//
//  ClassfiactionHeadTypeImageCollectionReusableView.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/4.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ClassfiactionHeadTypeImageCollectionReusableView.h"

@implementation ClassfiactionHeadTypeImageCollectionReusableView

- (void)awakeFromNib {
    // Initialization code
}
-(void)loadRecommendImageViewModel:(id)model WithIndex:(NSIndexPath*)indexpath
{
    self.indexpath = indexpath;

}
- (IBAction)cellClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(ClassfiactionHeadTypeImageCollectionReusableViewClickedWithindexPath:)]) {
        [self.delegate ClassfiactionHeadTypeImageCollectionReusableViewClickedWithindexPath:self.indexpath];
    }
}

@end
