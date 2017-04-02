//
//  KTRedraw.m
//  Iplay
//
//  Created by 推凯 on 2017/3/22.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTRedraw.h"
#import <QuartzCore/QuartzCore.h>


@implementation KTRedraw

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {

    

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShadowWithColor(context, CGSizeMake(10, 10), 10.0, [[UIColor purpleColor]CGColor]);
    CGContextAddRect(context, CGRectMake(0, 0, 90, 90));
    

    [[UIColor redColor]setFill];      //填充色
    [[UIColor clearColor]setStroke];//描边
    
    CGContextDrawPath(context, kCGPathEOFillStroke);



}


@end
