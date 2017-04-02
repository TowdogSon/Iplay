
//
//  KTTabBarViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/3/30.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTTabBarViewController.h"
#import "KTOneViewController.h"
#import "KTTwoViewController.h"
#import "KTThrViewController.h"


@implementation KTTabBarViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpSubViews];
}


-(void)setUpSubViews{
    KTOneViewController *one=[[KTOneViewController alloc]init];
    one.tabBarItem.title=@"one";
    
    KTTwoViewController*two=[KTTwoViewController new];
    two.tabBarItem.title=@"two";
    
    KTThrViewController*thr=[[KTThrViewController alloc]init];
    thr.tabBarItem.title=@"three";
    
    [self addChildViewController:one];
    [self addChildViewController:two];
    [self addChildViewController:thr];

    
}

@end
