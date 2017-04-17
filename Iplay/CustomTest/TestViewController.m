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
@property(nonatomic,strong)UIView*contentView;
@end

@implementation TestViewController

#pragma mark   Getters

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

-(UIView *)contentView
{
    if (!_contentView) {
        _contentView=[[UIView alloc]init];
        _contentView.backgroundColor=[UIColor yellowColor];

    }
    return _contentView;
}
#pragma mark private Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self layout];
}

-(void)layout{
    
    self.view.backgroundColor=[UIColor whiteColor];
    //上边 tab
    TopMenuView*topView=[[TopMenuView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, 50)];
    topView.titleArray=@[@"配送中",@"异常订单加长",@"已完成"];
    
    //底部 tab
    BottomMenusView *bottomView=[[BottomMenusView alloc]initWithFrame:
                                 CGRectMake(0, screenHeight-49, screenWidth, 49)
                                                               Titles:self.titles
                                                         NormalImages:self.images
                                                         SelectImages:self.selectedImages];
    
    bottomView.delegate=self;
    
    [self.view addSubview: topView];
    [self.view addSubview:bottomView];
    [self.view addSubview:self.contentView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];

    
    [self addLabels];
    
}

-(void)addLabels{
    
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB",@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    
    CGFloat tempX=0;
    CGFloat tempLine=0;
    CGFloat tempY=0;
    
    NSMutableArray*labelArr=[NSMutableArray array];
    for (int i=0; i<hotSeaches.count; i++) {
        UILabel *label=[[UILabel alloc]init];
        label.text=hotSeaches[i];
        label.backgroundColor=[UIColor randomColor];
        label.textAlignment=NSTextAlignmentCenter;
        [label sizeToFit];
        label.width+=10;
        label.height+=10;
        label.x=tempX;//横坐标
        //是否需要换行

        BOOL isNeedNextLine=(tempX+label.width)>screenWidth;
        //如果需要换行则需要重置本label的 x,
        if (isNeedNextLine) {
            label.x=0;
            tempLine++;
        }
        tempX=CGRectGetMaxX(label.frame);//为下一个 label 提供 x
        label.y=tempY+label.height*tempLine;//纵坐标
        
        [self.contentView addSubview:label];
        [labelArr addObject:label];
    }
    UILabel*labelLast=labelArr.lastObject;
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(labelLast);
    }];
    
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
