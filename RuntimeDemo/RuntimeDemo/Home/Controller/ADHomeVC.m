//
//  ADHomeVC.m
//  RuntimeDemo
//
//  Created by 阿蛋 on 16/8/9.
//  Copyright © 2016年 adan. All rights reserved.
//

#import "ADHomeVC.h"
#import "ADPch.h"
@implementation ADHomeVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
}
-(void)creatUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"归档" forState:UIControlStateNormal];
    btn.backgroundColor = ADColor(89, 196, 252);
    btn.frame = Rect(50, 100, ScreenWidth - 100, 50);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"测试归档结果" forState:UIControlStateNormal];
    btn2.backgroundColor = ADColor(89, 196, 252);
    btn2.frame = Rect(50, 200, ScreenWidth - 100, 50);
    [btn2 addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}
-(void)Click
{
    NSString *mobile = [ADAccountTool account].mobile;
    NSString *userid = [ADAccountTool account].userid;
    NSString *token = [ADAccountTool account].token;
    NSString *nickname = [ADAccountTool account].nickname;
    NSString *cityid = [ADAccountTool account].cityid;
    NSString *isaddress = [ADAccountTool account].isaddress;
    NSString *updatetime = [ADAccountTool account].updatetime;
    ADLog(@"电话%@=用户id%@=用户token%@=用户昵称%@=忽略的城市属性%@=用户地址%@=更新时间=%@",mobile,userid,token,nickname,cityid,isaddress,updatetime);
}
-(void)click
{
    //2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobile"] =@18769789670;
    params[@"pswd"] =@1;
    //3.发送网络请求
    [ADHttpTool post:UserLogin params:params success:^(id responseObj) {
        ADLog(@"%@",responseObj);
        NSDictionary *data = responseObj[@"data"];
        if ([responseObj[@"status"]isEqualToString:@"1000"]) {
            //存储账号信息
            ADUserInfo *account = [ADUserInfo accountWithDict:data];
            //存储账号模型
            [ADAccountTool save:account];
        }} failure:^(NSError *error) {
            
        }];

}
@end
