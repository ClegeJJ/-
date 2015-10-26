//
//  CJRightMeunCenterRow.m
//  网易新闻
//
//  Created by mac527 on 15/10/26.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "CJRightMeunCenterRow.h"

@interface CJRightMeunCenterRow()
@property (weak, nonatomic) IBOutlet UIButton *TitleView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation CJRightMeunCenterRow

+ (instancetype)centerViewRow
{

    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CJRightMeunCenterRow" owner:nil options:nil];
    return [array lastObject];
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    
    [self.TitleView setTitle:title forState:UIControlStateNormal];
}

- (void)setImage:(NSString *)image
{
    _image = [image copy];
    
    self.iconView.image = [UIImage imageNamed:image];
    
}


@end
