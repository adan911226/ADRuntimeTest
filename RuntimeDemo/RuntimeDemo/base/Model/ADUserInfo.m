//
//  ADUserInfo.m
//  ADBaseViewController
//
//  Created by 阿蛋 on 16/8/7.
//  Copyright © 2016年 adan. All rights reserved.
//

#import "ADUserInfo.h"
#import "ADPch.h"
@interface ADUserInfo()<NSCoding>

@end

@implementation ADUserInfo

//字典转模型
+(instancetype)accountWithDict:(NSDictionary *)dict
{
    ADUserInfo *account = [[self alloc]init];
    account.userid = dict[@"userid"];
    account.token = dict[@"token"];
    account.mobile = dict[@"mobile"];
    account.nickname = dict[@"nickname"];
    account.cityid = dict[@"cityid"];
    account.isaddress = dict[@"isaddress"];
    account.updatetime = dict[@"updatetime"];
    return account;
}
-(NSArray *)ignoreNames{
    return @[@"cityid"];
}
//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        //1.获取所有成员变量,每个成员变量都是ivar类型的结构体
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i ++) {
            Ivar ivar = ivars[i];
            //2.将成员变量转换为NSString类型
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            //3.忽略不需要解档的key
            if ([[self ignoreNames]containsObject:key]) {
                continue;
            }
            //4.根据变量的名称解档
            id value = [aDecoder decodeObjectForKey:key];
            //5.将解档的值赋值给属性
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
//归档
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    //1.获取成员变量
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        //2.转换成NSString类型
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([[self ignoreNames]containsObject:key]) {
            continue;
        }
        //3.通过变量名取出变量的值
        id value = [self valueForKeyPath:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}
@end
