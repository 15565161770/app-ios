//
//  RootController.m
//  tabbar
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 河南智巢有限公司. All rights reserved.
//

#import "RootController.h"
#import "FirstController.h"
#import "SecondController.h"
#import "ThereController.h"
#import "FourController.h"
#import "UIImage+Extension.h"
#import "FaWeiBoController.h"
#import "MyTabBar.h"
//#import "HMNavigationController.h"
#import "MyNavigationController.h"
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
@interface RootController ()<MyTabBarDelegate, UITabBarControllerDelegate>

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAllChildVcs];
    
    [self addCustomTabBar];

    self.delegate = self;

}

#pragma mark 
- (void)addAllChildVcs
{
    FirstController *first = [[FirstController alloc]init];
    [self addOneChlildVc:first title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    first.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", 80];

    
    SecondController *second = [[SecondController alloc]init];
    [self addOneChlildVc:second title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    second.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", 80];

    
    ThereController *there = [[ThereController alloc]init];
    [self addOneChlildVc:there title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    there.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", 35];

    FourController *four = [[FourController alloc]init];
    [self addOneChlildVc:four title:@"我的" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    four.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", 70];

    
    // 在图标上显示所有的未读数
    [UIApplication sharedApplication].applicationIconBadgeNumber = 68;
}

- (void)addCustomTabBar
{
    // 创建自定义tabbar
    MyTabBar *customTabBar = [[MyTabBar alloc] init];
    customTabBar.myDelegate = self;
    // 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController
{
    // 强制重新布局子控件（内部会调用layouSubviews）
    [self.tabBar setNeedsLayout];
    
    UIViewController *vc = [viewController.viewControllers firstObject];
    if ([vc isKindOfClass:[FirstController class]]) {
        // 如果点击的是home控制器刷新
        // [self.home refresh:YES];

    } else {
        // 如果不是就不刷新
    }
}


- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[UITextAttributeTextColor] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    
    MyNavigationController *nav = [[MyNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

#pragma mark - HMTabBarDelegate
- (void)tabBarDidClickedPlusButton:(MyTabBar *)tabBar
{
    NSLog(@"中间按钮");
    // 弹出发微博控制器
    FaWeiBoController *compose = [[FaWeiBoController alloc] init];
    MyNavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:compose];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
