//
//  CJNavigationBar.m
//  网易新闻
//
//  Created by mac527 on 15/10/26.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "CJNavigationBar.h"

@implementation CJNavigationBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            if (view.centerX > self.width * 0.5) {
                view.x = self.width - view.height;
            }else if (view.centerX < self.width * 0.5){
                view.x = 0;
            }
        }
        
    }

}

@end
