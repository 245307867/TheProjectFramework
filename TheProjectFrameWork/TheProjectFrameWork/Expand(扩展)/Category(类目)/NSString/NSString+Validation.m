//
//  NSString+Validation.m
//  FaBestCare
//
//  Created by CallMe周琦 on 14/12/12.
//  Copyright (c) 2014年 CallMe周琦. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NSString+Validation.h"
#define NUMBERS @"0123456789\n"

@implementation NSString (Validation)
/**
 *  验证手机号
 *
 *  @param mobileNumber 手机号码
 *
 *  @return
 */
+(BOOL)validateMobile:(NSString* )mobileNumber
{
    if ([mobileNumber length] == 0) {
        return NO;
    }
    NSString *regex = @"^1[0-9]{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:mobileNumber];
    if (!isMatch) {
      
        return NO;
    }
    return YES;
}

/**
 *  验证纯英文
 *
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) textFieldEnglish:(NSString*) string
{
    NSString * regex = @"^[a-zA-Z]{3,7}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:pred];
    
    return isMatch;
}
/**
 *  验证纯数字
 *
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)textFieldreplacementString:(NSString *)string
{
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    if (!basicTest) {
        return NO;
    }
    return YES;
}

/**
 *  验证用户名是否合法
 *
 *  @param _userName <#_userName description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)verifyUserName:(NSString*) _userName
{
    NSInteger length = _userName.length;
    
    NSString * chinaSring = @"^[\u4e00-\u9fa5]+$";
    
    NSPredicate * preString = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",chinaSring];
    
    if (length<4) return @"用户名长度不能少于4个字符";
    
    if(length>20) return @"用户名长度不能大于20个字符";
    
    if ([preString evaluateWithObject:_userName]) {
        return @"用户名不能为汉字";
    }
    
    return @"";
    
}
/**
 *  验证QQ
 *
 *  @param BOOL <#BOOL description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)validateQQ:(NSString *)qq
{
    NSString *qqRegex = @"[1-9][0-9]{4,}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",qqRegex];
    return [QQTest evaluateWithObject:qq];
}
/**
 *  验证邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex   = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
/**
 *  输入判断
 *
 *  @param password <#password description#>
 *
 *  @return <#return value description#>
 */
+(BOOL)verifyPassword:(NSString*) password
{
    NSInteger length = password.length;
    
    if (length<6 || length>18) {
        
        return NO;
    }
    
    return YES;
}





@end
