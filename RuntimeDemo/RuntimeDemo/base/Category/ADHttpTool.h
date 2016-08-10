//
//  ADHttpTool.h
//  adan
//
//  Created by 阿蛋 on 15/12/20.
//  Copyright © 2015年 adan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADHttpTool : NSObject
//封装AFN
+(void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError * error))failure;
//发送POST请求
+(void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError * error))failure;

//上传图片
+(void)typePicturePOST:(NSString *)strPath parameters:(NSDictionary *)dic withPicureData:(NSData *)pictureData  withKey:(NSString *)key finish:(void (^)(NSData *data,NSError *error) )cb ;
@end
