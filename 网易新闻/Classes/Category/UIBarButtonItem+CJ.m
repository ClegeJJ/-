//
//  UIBarButtonItem+CJ.m
//  WeiBo
//
//  Created by mac527 on 15/9/11.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "UIBarButtonItem+CJ.h"

@implementation UIBarButtonItem (CJ)


+ (UIBarButtonItem *)itemWithImage:(NSString *)image target:(id)target action:(SEL)action
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    button.bounds = (CGRect){CGPointZero,button.currentBackgroundImage.size};
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]  initWithCustomView:button];

}

@end
