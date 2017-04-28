//
//  ThereController.m
//  tabbar
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 河南智巢有限公司. All rights reserved.
//

#import "ThereController.h"
#import "UIBarButtonItem+Extension.h"
@interface ThereController ()

@end

@implementation ThereController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"系统设置" style:UIBarButtonItemStyleDone target:self action:@selector(didReceive)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"系统设置" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem.enabled = NO;
}

- (void)didReceive {
    
    NSLog(@"didReceive");
}



@end
