//
//  HometableHeadView.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/4.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "HometableHeadView.h"

@implementation HometableHeadView

+(HometableHeadView*)headViewLoadView
{
    HometableHeadView * view = [[[NSBundle mainBundle] loadNibNamed:@"HometableHeadView" owner:self options:nil] firstObject];
    
    return view;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
