//
//  CJTitleView.m
//  网易新闻
//
//  Created by mac527 on 15/10/25.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "CJTitleView.h"

@implementation CJTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 高亮时是否自动调整图片
        self.adjustsImageWhenHighlighted = NO;
        
        // 设置选中时背景图片
        [self setImage:[UIImage imageNamed:@"navbar_netease"] forState:UIControlStateNormal];
        // 设置标题文字颜色
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        // 字体
        self.titleLabel.font = [UIFont boldSystemFontOfSize:24];
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        // 图片显示样式居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        // 文字显示样式右对齐
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.height = self.currentImage.size.height;
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    
    [self setTitle:title forState:UIControlStateNormal];
    NSDictionary *dict = @{NSFontAttributeName : self.titleLabel.font};
    CGFloat titleW = [title sizeWithAttributes:dict].width;
    self.width = titleW + self.titleEdgeInsets.left + self.currentImage.size.width;
}



@end
