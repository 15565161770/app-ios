//
//  MyTabBar.h
//  tabbar
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 河南智巢有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyTabBar;
@protocol MyTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(MyTabBar *)tabBar;

@end

@interface MyTabBar : UITabBar
@property (nonatomic, weak) id<MyTabBarDelegate> myDelegate;
@end
