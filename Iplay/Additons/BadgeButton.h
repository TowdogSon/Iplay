//
//  BadgeButton.h
//  Iplay
//
//  Created by 推凯 on 2017/4/6.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BadgeButton : UIButton
/**
 显示角标
 
 @param badgeNumber 角标数量
 */
- (void)showBadgeWithNumber:(NSInteger)badgeNumber;

/** 隐藏角标 */
- (void)hideBadge;

@end
