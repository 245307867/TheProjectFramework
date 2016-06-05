//
//  NSString+Validation.h
//  FaBestCare
//
//  Created by CallMe周琦 on 14/12/12.
//  Copyright (c) 2014年 CallMe周琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

/**
*  验证手机号
*
*  @param mobileNumber 手机号码
*
*  @return
*/
+(BOOL)validateMobile:(NSString* )mobileNumber;
/**
 *  验证纯英文
 *
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) textFieldEnglish:(NSString*) string;
/**
 *  验证纯数字
 *
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)textFieldreplacementString:(NSString *)string;
/**
 *  验证用户名是否合法
 *
 *  @param _userName <#_userName description#>
 *
 *  @return <#return value description#>
 */
+(NSString*)verifyUserName:(NSString*) _userName;
/**
 *  验证QQ
 *
 *  @param BOOL <#BOOL description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)validateQQ:(NSString *)qq;
/**
 *  验证邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)validateEmail:(NSString *)email;
/**
 *  输入判断
 *
 *  @param password <#password description#>
 *
 *  @return <#return value description#>
 */
+(BOOL)verifyPassword:(NSString*) password;

@end
