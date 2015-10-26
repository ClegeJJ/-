//
//  CJRightMeunViewController.m
//  网易新闻
//
//  Created by mac527 on 15/10/26.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "CJRightMeunViewController.h"
#import "HMRightMenuCenterViewRow.h"
@interface CJRightMeunViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIView *middle;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation CJRightMeunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HMRightMenuCenterViewRow *row = [self setUpCenterRowWithTitle:@"商城 能赚能花，土豪当家" icon:@"promoboard_icon_mall"];
    [self setUpCenterRowWithTitle:@"活动 4.0发布会粉丝招募" icon:@"promoboard_icon_activities"];
    [self setUpCenterRowWithTitle:@"应用 金币从来都是这送的" icon:@"promoboard_icon_apps"];
    self.middle.height = self.middle.subviews.count * row.height;
}

- (void)didShow
{
    [UIView transitionWithView:self.iconView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.iconView.image = [UIImage imageNamed:@"user_defaultgift"];

    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView transitionWithView:self.iconView duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                self.iconView.image = [UIImage imageNamed:@"default_avatar"];
            } completion:^(BOOL finished) {
                
            }];
        });
    }];

}

- (HMRightMenuCenterViewRow *)setUpCenterRowWithTitle:(NSString *)title icon:(NSString *)icon
{
    HMRightMenuCenterViewRow *row = [HMRightMenuCenterViewRow centerViewRow];
    row.title = title;
    row.icon = icon;
    row.y = self.middle.subviews.count * row.height;
    [self.middle addSubview:row];
    NSLog(@"%@",self.middle.subviews);
    return row;
}



@end
