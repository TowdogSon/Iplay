//
//  KTSignalViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/3/10.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTSignalViewController.h"
#import "KTblockViewController.h"
#import "KTOperation.h"
#import "SortTool.h"
@interface KTSignalViewController ()

@end

@implementation KTSignalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //初识 Masonry 布局
    NSArray*arr=@[@"排序",@"信号量",@"队列",@"push"];
    
    for (int i=0; i<arr.count; i++) {
        
        UIButton*bt=[UIButton buttonWithType:UIButtonTypeSystem];
        
        [self.view addSubview:bt];
        bt.tag=1000+i;

        [bt setBackgroundColor:[UIColor randomColor]];
        
        [bt mas_makeConstraints:^(MASConstraintMaker *make) {

            //centerOffset 是指在中间的位置的偏移量
            make.center.equalTo(self.view).centerOffset(CGPointMake(0, -30+i*30));
            make.size.mas_equalTo(CGSizeMake(100, 30));
        }];
        
        [bt setTitle:arr[i] forState: UIControlStateNormal];
        [bt addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
   
 
}

-(void)btnClick:(UIButton*)sender
{
    UIButton*button=sender;
    if (button.tag==1000) {
        [self sort];
        
    }else if (button.tag==1001)
    {
        [self addOpera];
    }else if (button.tag==1001)
    {
        [self testSignal];
    }else
    {
        KTblockViewController*blockVc=[[KTblockViewController alloc]init];
        blockVc.block = ^(NSString *str) {
            NSLog(@"%@",str);
        };
        [self.navigationController pushViewController:blockVc animated:YES];
    }
    
    
}
-(void)sort{
    
    NSMutableArray*mArr=[NSMutableArray new];
    
    for (int i =0;i<10; i++) {
        NSNumber *temNum=[NSNumber numberWithInteger:arc4random()%100];
        [mArr addObject:temNum];
        NSLog(@"输入的数-->%@",temNum);
    }
    
    NSArray* arr=[[SortTool shareInstance]sortByBubbleWithArray:mArr option:KTSortTypeAsending];
    
    for (int i=0; i<arr.count; i++) {
        NSLog(@"排序后的数-->%@",arr[i]);
    }
}

-(void)addOpera{
    NSOperationQueue*myQue=[NSOperationQueue new];
    myQue.name=@"KTQue";
    
    myQue.maxConcurrentOperationCount=3;
    
    KTOperation *op1=[[KTOperation alloc]initWithBlock:^{
        NSLog(@"11111");
    }];
    
    
    KTOperation *op2=[[KTOperation alloc]initWithBlock:^{
        NSLog(@"22222");
    }];
    [op1 addDependency:op2];
    KTOperation *op3=[[KTOperation alloc]initWithBlock:^{
        NSLog(@"33333");
    }];
    
    KTOperation *op4=[[KTOperation alloc]initWithBlock:^{
        NSLog(@"44444");
    }];
    
    KTOperation *op5=[[KTOperation alloc]initWithBlock:^{
        NSLog(@"55555");
    }];
    KTOperation *op6=[[KTOperation alloc]initWithBlock:^{
        NSLog(@"66666");
    }];
    
    [myQue addOperations:@[op2,op1,op3,op4,op5,op6] waitUntilFinished:NO];
    
    
}
-(void)testSignal{
    dispatch_semaphore_t testSem=dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
        for(int i=3;i>0;i--){
            sleep(1);
            NSLog(@"还剩%d秒",i);
        }
        dispatch_semaphore_signal(testSem);
    }) ;
    
    

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(testSem, DISPATCH_TIME_FOREVER);

        NSLog(@"我应该是在读秒后走的,否则就是信号量没起作用");

    });

}


-(void)dealloc{
        NSLog(@"%s",__func__);
    }


@end
