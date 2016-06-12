//
//  RegisterViewController.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/4.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
/** 电话号码输入 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextfield;
/** 下一步 */
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneNumberTextfield.delegate = self;
    
    // Do any additional setup after loading the view.
}
- (IBAction)nextStepButton:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --UITextFieldDelegate

@end
