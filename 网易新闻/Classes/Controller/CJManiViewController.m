//
//  CJManiViewController.m
//  网易新闻
//
//  Created by mac527 on 15/10/25.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "CJManiViewController.h"
#import "CJLeftMenuBar.h"
#import "CJNavigationController.h"
#import "CJNewsViewController.h"
#import "CJTitleView.h"
#import "CJReadingViewController.h"
#import "CJRightMeunViewController.h"

#define CJCoverTag 923

@interface CJManiViewController () <CJLeftMenuBarDelegate>
@property (nonatomic, weak) CJLeftMenuBar *leftMeau;
@property (nonatomic, weak) CJNavigationController *showingNavigationController;
@property (nonatomic, strong) CJRightMeunViewController *rigntMeun;
@end

@implementation CJManiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.初始化子控制器
    [self setupChildViewController];
    
    // 2.设置左侧菜单
    [self setupLeftMeun];
    
    // 3.设置右侧菜单
    [self setupRightMeun];
}

- (void)setupChildViewController
{
    CJNewsViewController *news = [[CJNewsViewController alloc] init];
    [self setUpViewController:news WithTitle:@"新闻"];
    
    CJReadingViewController *reading = [[CJReadingViewController alloc] init];
    [self setUpViewController:reading WithTitle:@"订阅"];
    
    UIViewController *picture = [[UIViewController alloc] init];
    [self setUpViewController:picture WithTitle:@"图片"];
    UIViewController *video = [[UIViewController alloc] init];
    [self setUpViewController:video WithTitle:@"视频"];
    UIViewController *follow = [[UIViewController alloc] init];
    [self setUpViewController:follow WithTitle:@"跟帖"];
    UIViewController *radio = [[UIViewController alloc] init];
    [self setUpViewController:radio WithTitle:@"电台"];
}

- (void)setupRightMeun
{
    self.rigntMeun = [[CJRightMeunViewController alloc] init];
    self.rigntMeun.view.x = self.view.width - self.rigntMeun.view.width;
    
    [self.view insertSubview:self.rigntMeun.view atIndex:1];
    
}

- (void)setupLeftMeun
{
    CJLeftMenuBar *left = [[CJLeftMenuBar alloc] init];
    left.frame = CGRectMake(0, kHeight * 0.15, kWidth * 0.6, kHeight * 0.7);
    left.delegate = self;
    [self.view insertSubview:left atIndex:1];
    self.leftMeau = left;
}

- (void)setUpViewController:(UIViewController *)Vc WithTitle:(NSString *)title
{
    Vc.view.backgroundColor = CJRandomColor;
    Vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"top_navigation_menuicon" target:self action:@selector(leftMenu)];
    Vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"top_navigation_infoicon" target:self action:@selector(rightMenu)];
    CJTitleView *titleView = [[CJTitleView alloc] init];
    titleView.title = title;
    Vc.navigationItem.titleView = titleView;
    CJNavigationController *nav = [[CJNavigationController alloc] initWithRootViewController:Vc];
    self.showingNavigationController = nav;
    
    [self addChildViewController:nav];
}


- (void)didSelectedLeftMeanuBar:(CJLeftMenuBar *)leftMenuBar from:(NSInteger)from to:(NSInteger)to
{
    CJNavigationController *oldNav = self.childViewControllers[from];
    [oldNav.view removeFromSuperview];
    
    CJNavigationController *newNav = self.childViewControllers[to];
    [self.view addSubview:newNav.view];
    newNav.view.transform = oldNav.view.transform;
    newNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-5, 0);
    newNav.view.layer.shadowOpacity = 0.2;
    
    self.showingNavigationController = newNav;
    
    
    [self coverDidClick:(UIButton *)[newNav.view viewWithTag:CJCoverTag]];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)coverDidClick:(UIButton *)cover
{
    [UIView animateWithDuration:0.25 animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
    

}
- (void)leftMenu
{
    self.rigntMeun.view.hidden = YES;
    self.leftMeau.hidden = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformTranslate(self.showingNavigationController.view.transform, kWidth * 0.6, 0);
    }];
    
    UIButton *cover = [[UIButton alloc] init];
    cover.frame = self.showingNavigationController.view.bounds;
    cover.tag = CJCoverTag;
    
    
    [cover addTarget:self action:@selector(coverDidClick:) forControlEvents:UIControlEventTouchDown];
    [self.showingNavigationController.view addSubview:cover];
}

- (void)rightMenu
{
    
    self.rigntMeun.view.hidden = NO;
    self.leftMeau.hidden = YES;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformTranslate(self.showingNavigationController.view.transform,- 325, 0);
    } completion:^(BOOL finished) {
        [self.rigntMeun didShow];
    }];
    
    UIButton *cover = [[UIButton alloc] init];
    cover.frame = self.showingNavigationController.view.bounds;
    cover.tag = CJCoverTag;
    [cover addTarget:self action:@selector(coverDidClick:) forControlEvents:UIControlEventTouchDown];
    [self.showingNavigationController.view addSubview:cover];
    
}
@end
