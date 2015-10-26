//
//  CJLeftMenuBar.h
//  网易新闻
//
//  Created by mac527 on 15/10/25.
//  Copyright (c) 2015年 mac527. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJLeftMenuBar;
@protocol CJLeftMenuBarDelegate <NSObject>

@optional
- (void)didSelectedLeftMeanuBar:(CJLeftMenuBar *)leftMenuBar from:(NSInteger)from to:(NSInteger)to;

@end

@interface CJLeftMenuBar : UIView
@property (nonatomic, weak) id<CJLeftMenuBarDelegate> delegate;
@end
