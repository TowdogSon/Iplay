//
//  JSPatchViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/2/26.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "JSPatchViewController.h"

@interface JSPatchViewController ()

@end

@implementation JSPatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
}

-(void)test{
    
    self.testLabel.text=@"THIS IS A BUG!!!";
    
    [UIDevice systemVersion];
    [[UIScreen mainScreen] currentBounds];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(double)versionCompareWithVersion:(double)v1 andAnotherVersion:(double)v2
{
    double bigerVersion=0.0;
    
    if (v1>v2||v1==v2) {
        bigerVersion=v1;
    }else
    {
        bigerVersion=v2;
    }
    
    return bigerVersion;
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
