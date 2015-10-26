//
//  UIImage+Extension.m
//  网易新闻
//
//  Created by mac527 on 15/10/25.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGSize size = CGSizeMake(100, 100);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [color set];
    UIRectFill(CGRectMake(0, 0, 100, 100));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
