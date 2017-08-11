//
//  UINavigationController+AKHook.m
//  Iplay
//
//  Created by tuikai on 2017/8/11.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "UINavigationController+AKHook.h"

@implementation UINavigationController (AKHook)
+ (void)hookUINavigationController_push
{
    Method pushMethod = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
    Method hookMethod = class_getInstanceMethod([self class], @selector(hook_pushViewController:animated:));
    method_exchangeImplementations(pushMethod, hookMethod);
}
- (void)hook_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSString *popDetailInfo = [NSString stringWithFormat: @"%@ - %@ - %@", NSStringFromClass([self class]), @"push", NSStringFromClass([viewController class])];
    NSLog(@"%@", popDetailInfo);
    [self hook_pushViewController:viewController animated:animated];
}

+ (void)hookUINavigationController_pop
{
    Method popMethod = class_getInstanceMethod([self class], @selector(popViewControllerAnimated:));
    Method hookMethod = class_getInstanceMethod([self class], @selector(hook_popViewControllerAnimated:));
    method_exchangeImplementations(popMethod, hookMethod);
}
- (nullable UIViewController *)hook_popViewControllerAnimated:(BOOL)animated
{
    NSString *popDetailInfo = [NSString stringWithFormat:@"%@ - %@", NSStringFromClass([self class]), @"pop"];
    NSLog(@"%@", popDetailInfo);
    return [self hook_popViewControllerAnimated:animated];
}


@end
