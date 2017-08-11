//
//  KTTestModelViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/3/5.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTTestModelViewController.h"
#import "ShopCartModel.h"
#import "RecommendModel.h"
@interface KTTestModelViewController ()

@end

@implementation KTTestModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    NSString*path=[[NSBundle mainBundle]pathForResource:@"moreRecommand" ofType:@"json"];
    NSString*jsonStr=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    relateProducts*products=[relateProducts modelWithJSON:jsonStr];
    NSLog(@"products.list[0] ->>%@",products.list[0]);
    
    [self handleRequestResult];
}

-(void)handleRequestResult
{
    NSString*path=[[NSBundle mainBundle]pathForResource:@"shoppingCart" ofType:@"json"];
    NSString*jsonStr=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSDictionary*dict=[jsonStr jsonValueDecoded];
    NSArray *buyerDataArr=dict[@"buyers_data"];
    
    RootClass *root=[RootClass modelWithJSON:dict];
    NSArray*buyerDatas=[NSArray modelArrayWithClass:[BuyersData class] json:buyerDataArr];

    NSLog(@"%ld",buyerDatas.count);
    
    
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
