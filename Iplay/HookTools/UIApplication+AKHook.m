//
//  UIApplication+AKHook.m
//  Iplay
//
//  Created by tuikai on 2017/8/11.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "UIApplication+AKHook.h"

@implementation UIApplication (AKHook)
+ (void)hookUIApplication
{
    Method controlMethod = class_getInstanceMethod([UIApplication class], @selector(sendAction:to:from:forEvent:));
    Method hookMethod = class_getInstanceMethod([self class], @selector(hook_sendAction:to:from:forEvent:));
    method_exchangeImplementations(controlMethod, hookMethod);
}

- (BOOL)hook_sendAction:(SEL)action to:(nullable id)target from:(nullable id)sender forEvent:(nullable UIEvent *)event;
{
    NSString *actionDetailInfo = [NSString stringWithFormat:@" %@ - %@ - %@", NSStringFromClass([target class]), NSStringFromClass([sender class]), NSStringFromSelector(action)];
    UIButton*bt=sender;

    NSLog(@"%@ tag-->%ld", actionDetailInfo,bt.tag);
    return [self hook_sendAction:action to:target from:sender forEvent:event];
}

@end
