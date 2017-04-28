//
//  FirstController.m
//  tabbar
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 河南智巢有限公司. All rights reserved.
//

#import "FirstController.h"
#import "OneController.h"
#import "UIBarButtonItem+Extension.h"
@interface FirstController ()

@end

@implementation FirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 40);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(didReceive) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // 设置导航栏按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" highImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    
    // 0.清零提醒数字
//    [UIApplication sharedApplication].applicationIconBadgeNumber -= self.tabBarItem.badgeValue.intValue;
//    self.tabBarItem.badgeValue = nil;

}

- (void)didReceive{
    OneController*one = [[OneController alloc]init];
    [self.navigationController pushViewController:one animated:YES];
}


- (void)friendSearch
{
    NSLog(@"friendSearch---");
    
     OneController *one = [[OneController alloc]init];
    one.title = @"OneVc";
    [self.navigationController pushViewController:one animated:YES];
}

#pragma mark - 刷新
- (void)refresh:(BOOL)fromSelf
{
    if (self.tabBarItem.badgeValue) { // 有数字
        // 让表格回到最顶部
        //        NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
        //        [self.tableView scrollToRowAtIndexPath:firstRow atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        // 转圈圈
//        [self.refreshControl beginRefreshing];
        
        // 刷新数据
//        [self loadNewStatuses:self.refreshControl];
    } else if (fromSelf) { // 没有数字
        // 让表格回到最顶部
        NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView scrollToRowAtIndexPath:firstRow atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}



- (void)pop
{
    NSLog(@"123");
}
@end
