//
//  NetWork.m
//  TheProjectFrameWork
//
//  Created by maple on 16/6/4.
//  Copyright © 2016年 MapleDongSen. All rights reserved.
//

#import "NetWork.h"
#import "NetWorkType.h"
#import "NetWork+BodyAndCookie.h"
@implementation NetWork
/**
 *  get请求
 *
 *  @param url        请求Url
 *  @param block      <#block description#>
 *  @param errorblock <#errorblock description#>
 */
+(void)GETNetWorkWithUrl:(NSString*)url successBlock:(SuccessBlock)block errorBlock:(ErrorBlock)errorblock
{
    if ([NetWorkType CheckNetWorkType]==NetWorkTypesNoNe) {
        errorblock(@"没有网络");
        return;
    }
    //接口拼接
    NSString * getUrl = [NSString stringWithFormat:@"%@%@",KAppRootUrl,url];
    //接口空字符去掉
    NSString * getReplaceUrls = [getUrl stringByReplacingOccurrencesOfString:@" " withString:@""];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置请求体
    [NetWork setHttpBody:manager.requestSerializer];
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    [manager GET:getReplaceUrls parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [NetWork getHttpCookie];
        block(responseObject);

    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        errorblock(error.description);
    }];
}
/**
 *  posy请求
 *
 *  @param url        请求url
 *  @param data       参数
 *  @param block      <#block description#>
 *  @param errorblock <#errorblock description#>
 */
+(void)PostNetWorkWithUrl:(NSString*)url with:(id)data successBlock:(SuccessBlock)block errorBlock:(ErrorBlock)errorblock
{
    if ([NetWorkType CheckNetWorkType]==NetWorkTypesNoNe) {
        errorblock(@"没有网络");
        return;
    }
    //接口拼接
    NSString * postUrl = [NSString stringWithFormat:@"%@%@",KAppRootUrl,url];
    //接口空字符去掉
    NSString * postReplaceUrls = [postUrl stringByReplacingOccurrencesOfString:@" " withString:@""];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置请求体
    [NetWork setHttpBody:manager.requestSerializer];
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", @"text/plain", nil]];
    // 请求
    [manager POST:postReplaceUrls parameters:data success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        // 获取的数据传回去
        [NetWork getHttpCookie];
        block(responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        errorblock(error.description);
    }];

}


@end
