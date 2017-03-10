//
//  KTSignalViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/3/10.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTSignalViewController.h"

@interface KTSignalViewController ()

@end

@implementation KTSignalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
        [self test];
    }
-(void)test{
    dispatch_semaphore_t testSem=dispatch_semaphore_create(0);
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
        for(int i=3;i>0;i--){
            sleep(1);
            NSLog(@"还剩%d秒",i);
        }
//        dispatch_semaphore_signal(testSem);
//    }) ;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
//    dispatch_semaphore_wait(testSem, DISPATCH_TIME_FOREVER);
        NSLog(@"我应该是在读秒后走的,否则就是信号量没起作用");

    });

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
        NSLog(@"%s",__func__);
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
