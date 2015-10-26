//
//  CJLeftMenuBar.m
//  网易新闻
//
//  Created by mac527 on 15/10/25.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import "CJLeftMenuBar.h"
#import "CJLetfMenuButton.h"
@interface CJLeftMenuBar()
@property (nonatomic, weak) CJLetfMenuButton *selectedButton;

@end

@implementation CJLeftMenuBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1. 设置与用户交互 button才能监听事件
        self.userInteractionEnabled = YES;
        
        
        // 2. 设置bar的背景颜色
        self.backgroundColor = [UIColor clearColor];
        CGFloat alpha = 0.2;
        
        // 3. 设置子控件
        [self setupButtonWithTitle:@"新闻" image:@"sidebar_nav_news" bgColor:CJColorRGBA(202, 68, 73, alpha)];
        [self setupButtonWithTitle:@"订阅" image:@"sidebar_nav_reading" bgColor:CJColorRGBA(190, 111, 69, alpha)];
        [self setupButtonWithTitle:@"图片" image:@"sidebar_nav_photo" bgColor:CJColorRGBA(76, 132, 190, alpha)];
        [self setupButtonWithTitle:@"视频" image:@"sidebar_nav_video" bgColor:CJColorRGBA(101, 170, 78, alpha)];
        [self setupButtonWithTitle:@"跟贴" image:@"sidebar_nav_comment" bgColor:CJColorRGBA(170, 172, 73, alpha)];
        [self setupButtonWithTitle:@"电台" image:@"sidebar_nav_radio" bgColor:CJColorRGBA(190, 62, 119, alpha)];
        
    }
    return self;
}

/**
 *  设置按钮
 *
 *  @param title   标题
 *  @param image   小图片
 *  @param bgImage 选中时背景图片
 */
- (UIButton *)setupButtonWithTitle:(NSString *)title image:(NSString *)image bgColor:(UIColor *)bgColor
{
    CJLetfMenuButton *btn = [[CJLetfMenuButton alloc] init];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateSelected];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];  // 文字颜色
    
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];   // 字体
    
    // 设置高亮的时候不要让图标变色
    btn.adjustsImageWhenHighlighted = NO;
    btn.tag = self.subviews.count;
    
    // 设置按钮的内容左对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 设置间距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    
    
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    return btn;
    
    
}

#pragma mark - 监听事件
- (void)buttonClick:(UIButton *)button
{
    
    if ([self.delegate respondsToSelector:@selector(didSelectedLeftMeanuBar:from:to:)]) {
        [self.delegate didSelectedLeftMeanuBar:self from:self.selectedButton.tag to:button.tag];
    }
    
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    self.selectedButton.selected = YES;
}


- (void)setDelegate:(id<CJLeftMenuBarDelegate>)delegate
{
    _delegate = delegate;
    
    // 默认选中 新闻
    [self buttonClick:self.subviews.firstObject];
}


/**
 *  调整子控件位置
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnX = 0;
    CGFloat btnH = self.height / self.subviews.count;
    CGFloat btnW = self.width;
    // 调整按钮位置
    for (int index = 0; index < self.subviews.count; index ++) {
        CGFloat btnY = index * btnH;
        UIButton *btn = self.subviews[index];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
}


@end
