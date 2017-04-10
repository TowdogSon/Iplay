//
//  BaseMenuView.h
//  Iplay
//
//  Created by 推凯 on 2017/4/6.
//  Copyright © 2017年 TK. All rights reserved.
//
/*********控件是一个上部按钮栏的按钮选择,可以设置右上角信息数量******************/

#import <UIKit/UIKit.h>


@class TopMenuView;

@protocol BaseMenuViewDelegate <NSObject>

/** 菜单view的第几个button被点击(从0开始) */
- (void)menuView:(TopMenuView *)menuView didClickButtonAtIndex:(NSInteger)index;

@end


@interface TopMenuView : UIView

/** 标题数组 */
@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,weak) id<BaseMenuViewDelegate> delegate;

/** 选中第几个按钮（从0开始） */
- (void)selectButtonAtButtonIndex:(NSInteger)buttonIndex;

/**
 显示按钮的角标
 
 @param badge 角标数
 @param buttonIndex 第几个button
 */
- (void)showButtonBadge:(NSInteger)badge atButtonIndex:(NSInteger)buttonIndex;

@end
