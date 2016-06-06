//
//  BaseView.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

+(id)loadView{
    id view  = [[[NSBundle mainBundle] loadNibNamed:[[self class] description] owner:nil options:nil]firstObject];
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
