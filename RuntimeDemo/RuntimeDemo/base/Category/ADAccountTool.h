//
//  ADAccountTool.h
//  ADSweep
//
//  Created by 阿蛋 on 15/12/15.
//  Copyright © 2015年 Adan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ADUserInfo;
@interface ADAccountTool : NSObject

//存储账号
+(void)save:(ADUserInfo *)account;
//读取账号
+(ADUserInfo *)account;

@end
