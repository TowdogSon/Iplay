//
//  TestViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/4/6.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "TestViewController.h"
#import "TopMenuView.h"
#import"BottomMenusView.h"
@interface TestViewController ()<BottomMenusViewDelegate>


@property(nonatomic,strong)NSArray*titles;
@property(nonatomic,strong)NSArray*images;

@property(nonatomic,strong)NSMutableArray*selectedImages;

@end

@implementation TestViewController


-(NSArray *)titles
{
    if (!_titles) {
        _titles=@[@"首页",@"产品",@"交易",@"我的"];
    }
    return _titles;
}
-(NSArray *)images
{
    if (!_images) {
        _images=@[@"home",@"product",@"setting",@"my"];
    }
    return _images;
}
-(NSArray *)selectedImages
{
    if (!_selectedImages) {
        
        _selectedImages=[NSMutableArray new];
        for (NSString*str in _images) {
            NSString*selectedImageName=[str stringByAppendingString:@"_selected"];
            [_selectedImages addObject:selectedImageName];
        }
    }
    return _selectedImages;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    TopMenuView*topView=[[TopMenuView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, 50)];
    topView.titleArray=@[@"配送中",@"异常订单加长",@"已完成"];
    [self.view addSubview: topView];
    

    
    BottomMenusView *bottomView=[[BottomMenusView alloc]initWithFrame:
       CGRectMake(0, screenHeight-49, screenWidth, 49)
        Titles:self.titles
        NormalImages:self.images
        SelectImages:self.selectedImages];
    
        bottomView.delegate=self;
    
    [self.view addSubview:bottomView];
    
}

-(void)BottomMenusView:(BottomMenusView *)bottomView didClickedBtnWithTag:(NSInteger)tag
{
    NSLog(@"%s==%ld",__func__,tag);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
