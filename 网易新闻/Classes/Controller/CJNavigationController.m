//
//  CJNavigationController.m
//  网易新闻
//
//  Created by mac527 on 15/10/25.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "CJNavigationController.h"
#import "CJNavigationBar.h"
@interface CJNavigationController ()

@end

@implementation CJNavigationController

+ (void)initialize
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    // 设置导航栏背景
    [appearance setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setValue:[[CJNavigationBar alloc] init] forKey:@"navigationBar"];
}



@end
