//
//  LoginViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
/** 账号输入框*/
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
/** 密码输入框*/
@property (weak, nonatomic) IBOutlet UITextField *userPassWordsTextField;
/** 登陆按钮*/
@property (weak, nonatomic) IBOutlet UIButton *userLoginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLoginView];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --AddPrivateMethods 添加的私有方法
-(void)setUserLoginButton{
    self.userLoginButton.titleLabel.textColor = [UIColor lightGrayColor];
    self.userLoginButton.backgroundColor = [UIColor grayColor];
}
/**
 *  加载登陆页面视图
 */
-(void)loadLoginView{
    self.userPassWordsTextField.delegate = self;
    [self setUserLoginButton];
}
/**
 *  登陆功能
 *
 *  @param sender
 */
- (IBAction)UserLoginClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/**
 *  返回
 *
 *  @param sender <#sender description#>
 */
- (IBAction)backToPresentViewController:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
/**
 *  密码查看
 *
 *  @param sender sender description
 */
- (IBAction)lookPassWords:(UIButton *)sender {
    if (sender.selected) {
        self.userPassWordsTextField.secureTextEntry = YES;
    }
    else{
        self.userPassWordsTextField.secureTextEntry = NO;
    }
        sender.selected = !sender.selected;
}
#pragma mark  - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField==self.userPassWordsTextField) {
        if (range.location>6) {
            self.userLoginButton.titleLabel.textColor = [UIColor whiteColor];
            self.userLoginButton.backgroundColor = [UIColor redColor];
        }
        else{
            [self setUserLoginButton];
        }
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    [self setUserLoginButton];
        return YES;
}

@end
