//
//  UINavigationController+AKHook.h
//  Iplay
//
//  Created by tuikai on 2017/8/11.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (AKHook)
+ (void)hookUINavigationController_push;
+ (void)hookUINavigationController_pop;
@end
