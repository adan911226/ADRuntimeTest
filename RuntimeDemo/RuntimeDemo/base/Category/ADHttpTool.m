//
//  ADHttpTool.m
//  adan
//
//  Created by 阿蛋 on 15/12/20.
//  Copyright © 2015年 adan. All rights reserved.
//

#import "ADHttpTool.h"
#import "AFNetworking.h"
@implementation ADHttpTool
//封装AFN
+(void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError * error))failure
{
    //1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //2.发送网络请求
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObj) {
        if (success) {
            success(responseObj);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

//发送POST请求
+(void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id))success failure:(void(^)(NSError *))failure
{
    //1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //2.发送网络请求
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObj) {
        if (success) {
            success(responseObj);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}
@end
