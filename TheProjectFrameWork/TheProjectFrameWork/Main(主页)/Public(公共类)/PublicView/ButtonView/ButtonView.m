//
//  ButtonView.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/8.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

+(ButtonView*)loadButtonViewWith:(UIImage*)image andbadgeValue:(NSString*)badgeValue andFreme:(CGRect)frame{
    ButtonView * view =[[[NSBundle mainBundle] loadNibNamed:@"ButtonView" owner:nil options:nil] firstObject];
    view.frame = frame;
    view.badgeValuLabel.layer.masksToBounds = YES;
    view.badgeValuLabel.layer.cornerRadius = 8;
    view.ButtonImageView.image = image;
    view.badgeValuLabel.text = badgeValue;
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
