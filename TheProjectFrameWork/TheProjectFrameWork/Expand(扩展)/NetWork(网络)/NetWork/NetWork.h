//
//  NetWork.h
//  TheProjectFrameWork
//
//  Created by maple on 16/6/4.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWork : NSObject
/** 成功回调 */
typedef void(^SuccessBlock)(NSData * data);
/** 失败回调 */
typedef void(^ErrorBlock)(NSString * error);
/**
 *  Get请求
 *
 *  @param url        接口除根域名外地址
 *  @param block      成功回调
 *  @param errorblock 失败回调
 */
+(void)GETNetWorkWithUrl:(NSString*)url successBlock:(SuccessBlock)block errorBlock:(ErrorBlock)errorblock;
/**
 *  Post请求
 *
 *  @param url        接口除根域名外地址
 *  @param data       参数
 *  @param block      成功回调
 *  @param errorblock 失败回调
 */
+(void)PostNetWorkWithUrl:(NSString*)url with:(id)data successBlock:(SuccessBlock)block errorBlock:(ErrorBlock)errorblock;
@end
