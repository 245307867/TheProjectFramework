//
//  NSString+Calculate.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/3.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "NSString+Calculate.h"

@implementation NSString (Calculate)
/**
 *  字符串长度计算
 *
 *  @param string 内容
 *  @param font   字体
 *  @param height 高度
 *  @param weight 宽度
 *
 *  @return
 */
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxHeight:(float) height maxWeight :(float)weight
{
    
    CGRect rect = [string boundingRectWithSize:CGSizeMake(weight, height)//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                    attributes:@{NSFontAttributeName: font}//传人的字体字典
                                       context:nil];
    
    return rect.size;
}

@end
