//
//  CoreDataViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/2/19.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "CoreDataViewController.h"
#import "AppDelegate.h"
#import "ArInfo+CoreDataClass.h"

#import "Iplay-Swift.h" //此头文件可在 build Setting中找到
#import "MainTableViewController.h"
@interface CoreDataViewController ()

@end

@implementation CoreDataViewController
@synthesize context=_context;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setUpCoreData];
    });
    
    
   // OC 调用 Swift方法
    KTSwiftViewController* vc=[[KTSwiftViewController alloc]init];
    NSLog(@"%@",[vc test]);
}

-(void)setUpCoreData{
    
    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication ]delegate];
    self.context=delegate.managedObjectContext;
    
    //增
    ArInfo*art=[NSEntityDescription insertNewObjectForEntityForName:@"ArInfo" inManagedObjectContext:_context];
    art.myid=@"222";
    art.myname=@"lisi";
    NSError*error=nil;
    
    if (![_context save:&error]) {
        NSLog(@"%@",[error localizedDescription]);
    }
    //查找所有
    NSFetchRequest *fetch=[[ NSFetchRequest alloc]init];
    
    NSEntityDescription*entity= [NSEntityDescription entityForName:@"ArInfo" inManagedObjectContext:_context];
    
    //查询条件可用 NSPredicate 定义,类似于 SQL语句
    NSPredicate *preidct=[NSPredicate predicateWithFormat:@"myid =='222'"];
    [fetch setPredicate:preidct];
    [fetch setEntity:entity];
    NSArray *fetchObject = [_context executeFetchRequest:fetch error:&error];
  
    //删除数据
    if (fetchObject.count>1) {
        for (NSManagedObject*obj in fetchObject) {
            ArInfo*art=(ArInfo*)obj;
            if ([art.myid isEqualToString:@"111"]) {
                [_context deleteObject:art];
                [_context save:nil];
            }
        }
    }
    
    for (NSManagedObject *info in fetchObject) {
        NSLog(@"id:%@",[info valueForKey:@"myid"]);
        NSLog(@"name:%@",[info valueForKey:@"myname"]);
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
