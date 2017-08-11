//
//  UIViewController+AKHook.m
//  Iplay
//
//  Created by tuikai on 2017/8/11.
//  Copyright © 2017年 TK. All rights reserved.
//
/**
 *
 *----------Dragon be here!----------/
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛
 * 　　　　┃　　　┃神兽保佑
 * 　　　　┃　　　┃代码无BUG！
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　　　┣┓
 * 　　　　┃　　　　　　　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 * ━━━━━━神兽出没━━━━━━
 */
#import "UIViewController+AKHook.h"

@implementation UIViewController (AKHook)
+ (void)hookUIViewController
{
    Method appearMethod = class_getInstanceMethod([self class], @selector(viewDidAppear:));
    Method hookMethod = class_getInstanceMethod([self class], @selector(hook_ViewDidAppear:));
    method_exchangeImplementations(appearMethod, hookMethod);
}
- (void)hook_ViewDidAppear:(BOOL)animated
{
    NSString *appearDetailInfo = [NSString stringWithFormat:@" %@ - %@", NSStringFromClass([self class]), @"didAppear"];
    NSLog(@"%@", appearDetailInfo);
    [self hook_ViewDidAppear:animated];
}

@end
