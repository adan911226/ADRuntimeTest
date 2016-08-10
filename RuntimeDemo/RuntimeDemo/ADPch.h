//
//  ADPch.h
//  RuntimeDemo
//
//  Created by 阿蛋 on 16/8/9.
//  Copyright © 2016年 adan. All rights reserved.
//

#ifndef ADPch_pch
#define ADPch_pch
//存储账号
#import "ADUserInfo.h"
#import "ADAccountTool.h"
#import "ADHttpTool.h"
#import <objc/runtime.h>
#import <objc/message.h>



#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define ADColor(r,g,b)[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ScreenWidth        [UIScreen mainScreen].bounds.size.width
#define ScreenHeight       [UIScreen mainScreen].bounds.size.height
#define delegate           self.tableView.delegate
#define dataSource         self.tableView.dataSource
#define ADAccountFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"account.data"]
#define UserLogin @"http://saocheng.bjqttd.com/index.php/api/User/login"


#ifdef DEBUG//如果是调试状态
#define ADLog(...) NSLog(__VA_ARGS__)
#else//如果是发布状态,关闭log
#define ADLog(...)
#endif
#endif /* ADPch_pch */
