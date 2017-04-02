//
//  KTblockViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/3/29.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTblockViewController.h"

@interface KTblockViewController ()

@end

@implementation KTblockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor randomColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated
{
    
    if (self.block) {
        self.block(@"你好");
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
