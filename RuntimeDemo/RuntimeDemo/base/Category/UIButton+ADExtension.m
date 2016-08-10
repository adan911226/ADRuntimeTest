//
//  UIButton+ADExtension.m
//  RuntimeDemo
//
//  Created by 阿蛋 on 16/8/9.
//  Copyright © 2016年 adan. All rights reserved.
//

#import "UIButton+ADExtension.h"
#import "ADPch.h"
@implementation UIButton (ADExtension)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method m1 = class_getClassMethod([self class], @selector(buttonWithType:));
        Method m2 = class_getClassMethod([self class], @selector(ADbuttonWithType:));
        method_exchangeImplementations(m1, m2);
    });
}
+(UIButton *)ADbuttonWithType:(UIButtonType)buttonType
{
    UIButton *btn = [UIButton ADbuttonWithType:UIButtonTypeCustom];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    return btn;
}
@end
