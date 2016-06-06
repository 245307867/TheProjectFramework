//
//  ClassificationTitleView.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/6.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "ClassificationTitleView.h"

@interface ClassificationTitleView ()<UITextFieldDelegate>

@end

@implementation ClassificationTitleView

+(ClassificationTitleView*)TitleViewCreatWithFrame:(CGRect)frame{
    ClassificationTitleView * view = [[[NSBundle mainBundle] loadNibNamed:@"ClassificationTitleView" owner:nil options:nil] firstObject];
    view.searchContentTextField.delegate = view ;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 6.0;
    view.layer.borderWidth = 1.0;
    view.layer.borderColor = [[UIColor whiteColor] CGColor];
    view.frame = frame;
    return view;
}
#pragma mark --UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        [self.delegate textFieldShouldBeginEditing:textField];
    }
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.delegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
      return  [self.delegate textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.delegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
      return [self.delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
       return  [self.delegate textFieldShouldClear:textField];

    }
    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
       return [self.delegate textFieldShouldReturn:textField];
    }
    return YES;
}


@end
