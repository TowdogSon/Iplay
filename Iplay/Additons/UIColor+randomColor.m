//
//  UIColor+randomColor.m
//  Iplay
//
//  Created by tuikai on 2017/5/15.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "UIColor+randomColor.h"

@implementation UIColor (randomColor)
+(instancetype)randomColor{
    
    return  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

@end
