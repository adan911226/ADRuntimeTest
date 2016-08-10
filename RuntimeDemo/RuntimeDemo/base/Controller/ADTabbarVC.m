//
//  ADTabbarVC.m
//  RuntimeDemo
//
//  Created by 阿蛋 on 16/8/9.
//  Copyright © 2016年 adan. All rights reserved.
//

#import "ADTabbarVC.h"
#import "ADNavigationVC.h"
#import "ADHomeVC.h"
#import "ADHelpVC.h"
#import "ADNewShopVC.h"
#import "ADPersonalVC.h"
@interface ADTabbarVC()
@property(nonatomic,strong)NSArray *imageArr;
@property(nonatomic,strong)NSArray *TitleArr;
@property(nonatomic,strong)NSMutableArray *HighArr;
@property(nonatomic,strong)NSMutableArray *VCArr;
@end
@implementation ADTabbarVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    _imageArr = @[@"tabbar_one",@"tabbar_two",@"tabbar_three",@"tabbar_four"];
    _TitleArr = @[@"首页",@"消息",@"新店开业",@"我的"];
    [self setupVC];
}

-(void)setupVC
{
    ADHomeVC *home = [ADHomeVC new];
    ADHelpVC *help = [ADHelpVC new];
    ADNewShopVC *shop = [ADNewShopVC new];
    ADPersonalVC *personal = [ADPersonalVC new];
    _VCArr = [NSMutableArray array];
    [_VCArr insertObject:home atIndex:0];
    [_VCArr insertObject:help atIndex:1];
    [_VCArr insertObject:shop atIndex:2];
    [_VCArr insertObject:personal atIndex:3];
    _HighArr = [NSMutableArray array];
    for (int i = 0; i < _imageArr.count; i ++) {
        NSString *highImageName = [_imageArr[i] stringByAppendingString:@"_selected"];
        [_HighArr insertObject:highImageName atIndex:i];
        [self addChildVC:_VCArr[i] imageName:_imageArr[i] highName:_HighArr[i] title:_TitleArr[i]];
   }
}

-(void)addChildVC:(UIViewController *)VC imageName:(NSString *)imageName highName:(NSString *)highName title:(NSString *)title
{
    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    ADNavigationVC *nav = [[ADNavigationVC alloc]initWithRootViewController:VC];
    [self addChildViewController:nav];
}
@end
