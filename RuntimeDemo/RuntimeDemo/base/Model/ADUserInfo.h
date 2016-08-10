//
//  ADUserInfo.h
//  ADBaseViewController
//
//  Created by 阿蛋 on 16/8/7.
//  Copyright © 2016年 adan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADUserInfo : NSObject
//用户id
@property(nonatomic,copy)NSString *userid;
//用户token
@property(nonatomic,copy)NSString *token;
//用户电话
@property(nonatomic,copy)NSString *mobile;
//用户昵称
@property(nonatomic,copy)NSString *nickname;
//cityid 城市id
@property(nonatomic,copy)NSString *cityid;
//城市名称
@property(nonatomic,copy)NSString *isaddress;
//更新时间
@property(nonatomic,copy)NSString *updatetime;
//字典转模型
+(instancetype)accountWithDict:(NSDictionary *)dict;
@end
