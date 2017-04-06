//
//  TestViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/4/6.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "TestViewController.h"
#import "TopMenuView.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    TopMenuView*topView=[[TopMenuView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, 50)];
    topView.titleArray=@[@"第一个",@"第二个",];
    [self.view addSubview: topView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
