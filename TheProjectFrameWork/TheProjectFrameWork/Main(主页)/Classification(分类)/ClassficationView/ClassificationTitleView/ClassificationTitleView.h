//
//  ClassificationTitleView.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/6.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "BaseView.h"

@protocol ClassificationTitleViewDelegate <NSObject>
/**
 *  <#Description#>
 *
 *  @param textField <#textField description#>
 *
 *  @return 默认返回YES
 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
/**
 *  <#Description#>
 *
 *  @param textField <#textField description#>
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField;
/**
 *  <#Description#>
 *
 *  @param textField <#textField description#>
 *
 *  @return 默认返回YES
 */
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
/**
 *  <#Description#>
 *
 *  @param textField <#textField description#>
 */
- (void)textFieldDidEndEditing:(UITextField *)textField;
/**
 *  <#Description#>
 *
 *  @param textField <#textField description#>
 *  @param range     <#range description#>
 *  @param string    <#string description#>
 *
 *  @return 默认返回YES
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
/**
 *  <#Description#>
 *
 *  @param textField <#textField description#>
 *
 *  @return 默认返回YES
 */
- (BOOL)textFieldShouldClear:(UITextField *)textField;
/**
 *  <#Description#>
 *
 *  @param textField <#textField description#>
 *
 *  @return 默认返回YES
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end



@interface ClassificationTitleView : BaseView
/** 搜索占位图片 */
@property (weak, nonatomic) IBOutlet UIImageView *searchImageView;
/** 搜索内容 */
@property (weak, nonatomic) IBOutlet UITextField *searchContentTextField;
/** 语音按钮 */
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
/** 代理 */
@property(assign,nonatomic) id<ClassificationTitleViewDelegate> delegate;

+(ClassificationTitleView*)TitleViewCreatWithFrame:(CGRect)frame;

@end
