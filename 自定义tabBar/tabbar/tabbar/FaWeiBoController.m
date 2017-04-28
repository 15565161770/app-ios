//
//  FaWeiBoController.m
//  tabbar
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 河南智巢有限公司. All rights reserved.
//

#import "FaWeiBoController.h"
#import "UIBarButtonItem+Extension.h"
@interface FaWeiBoController ()

@end

@implementation FaWeiBoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发微博";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;

}

/**
 *  取消
 */
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发送
 */
- (void)send
{
    NSLog(@"send");
}


@end
