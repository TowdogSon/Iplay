//
//  BaseMenuView.m
//  Iplay
//
//  Created by 推凯 on 2017/4/6.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "TopMenuView.h"
#import "BadgeButton.h"

/** 起始按钮的tag值 */
const NSInteger Button_Begin_Tag = 100;

@interface TopMenuView (){
    /** 底部会移动的红色线 */
    UIView *_redView;
}

@end

@implementation TopMenuView

#pragma mark - 构造方法
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // UI搭建
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI搭建
/** UI搭建 */
- (void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    
    //------- 创建红色线 -------//
    
    _redView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 2, 0, 2)];
    [self addSubview:_redView];
    _redView.backgroundColor = [UIColor colorWithHexString:@"d51619"];
    
}

#pragma mark - 设置菜单的标题
/** 设置菜单的标题 */
- (void)setTitleArray:(NSArray *)titleArray{
    
    _titleArray = titleArray;
    
    //------- 先将已有的button全部移除 -------//
    for (BadgeButton *button in self.subviews) {
        if ([button isMemberOfClass:[BadgeButton class]]) {
            [button removeFromSuperview];
        }
    }
    
    //------- 再依次创建button -------//
    for (int i = 0; i < _titleArray.count; i ++) {
        CGFloat buttonWidth = screenWidth / _titleArray.count; // 按钮宽
        BadgeButton *button = [[BadgeButton alloc]initWithFrame:CGRectMake(i * buttonWidth, 0, buttonWidth, self.height - 2)];
        [self addSubview:button];
        button.selected = NO;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
        button.tag = Button_Begin_Tag + i;
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
    }
    [self selectButtonAtButtonIndex:0]; //默认选中第一个,必须要 button 初始化以后

}

#pragma mark - 按钮点击
/** 按钮点击 */
- (void)buttonClicked:(BadgeButton *)sender{
    NSInteger index = sender.tag - Button_Begin_Tag;
    // 改变按钮状态
    [self selectButtonAtButtonIndex:index];
    // 代理方执行相应方法
    if ([self.delegate respondsToSelector:@selector(menuView:didClickButtonAtIndex:)]) {
        [self.delegate menuView:self didClickButtonAtIndex:index];
    }
}

#pragma mark - 第几个按钮被选中(只改变UI，不触发代理方法)
/** 第几个按钮被选中(只改变UI，不触发代理方法) */
- (void)selectButtonAtButtonIndex:(NSInteger)buttonIndex{
    
    // 遍历所有button
    for (BadgeButton *button in self.subviews) {
        if ([button isMemberOfClass:[BadgeButton class]]) {
            button.selected = NO;
        }
    }
    
    // 获取到当前被点击的button
    BadgeButton *clickedButton = [self viewWithTag:(buttonIndex + Button_Begin_Tag)];
    clickedButton.selected = YES;
    
    // 底部红色线移到被点按钮下方

    [UIView animateWithDuration:0.3 animations:^{
        _redView.width = clickedButton.width-20;
        _redView.centerX = clickedButton.centerX;
    }];
    
}

#pragma mark - 显示按钮的角标
/**
 显示按钮的角标
 
 @param badge 角标数
 @param buttonIndex 第几个button
 */
- (void)showButtonBadge:(NSInteger)badge atButtonIndex:(NSInteger)buttonIndex{
    BadgeButton *button = [self viewWithTag:(buttonIndex + Button_Begin_Tag)];
    [button showBadgeWithNumber:badge];
}

@end
