//
//  ADAccountTool.m
//  ADSweep
//
//  Created by 阿蛋 on 15/12/15.
//  Copyright © 2015年 Adan. All rights reserved.
//

#import "ADAccountTool.h"
#import "ADPch.h"
@implementation ADAccountTool
+(void)save:(ADUserInfo *)account
{
    //利用NSKeyedArchiver这个类把账号存储到filepath这个文件路径中,前提：这个账号必须遵守NSCoding协议
    [NSKeyedArchiver archiveRootObject:account toFile:ADAccountFilePath];
}

+(ADUserInfo *)account
{
    //解档
    return  [NSKeyedUnarchiver unarchiveObjectWithFile:ADAccountFilePath];
}

@end
