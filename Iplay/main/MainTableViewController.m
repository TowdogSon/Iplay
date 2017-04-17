//
//  MainTableViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/2/16.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "MainTableViewController.h"


#import "TableViewCell.h"
#import "ViewController.h"
#import "AudioViewController.h"
#import "CoreDataViewController.h"


@interface MainTableViewController ()


@end


@implementation MainTableViewController


#pragma 懒加载
-(NSArray *)itemArr
{
    if (_itemArr==nil) {
        _itemArr= @[@"SDWebImage 异步加载图片",@"录制音频练习",@"coreData 实操+Swift-OC 互相调用",@"JS调用 OC方法",@"支付宝之给我1分钱",@"JSPatch 测试热修复",@"本地存储图片两种方式",@"动画学习练习",@"YYModel 转化",@"多线程",@"部分圆角操作",@"自定义 tabbarVC",@"CustomTest",@"搜索"];
    }
    return _itemArr;
}

-(NSArray *)VCArr
{
    if (_VCArr==nil) {
  _VCArr=@[@"ViewController",@"AudioViewController",@"CoreDataViewController",@"JSViewController",@"KTAlipayViewController",@"JSPatchViewController",@"KTStoreImageViewController",@"kTAnimationsViewController",@"KTTestModelViewController",@"KTSignalViewController",@"PartCornerViewController",@"KTTabBarViewController",@"TestViewController",@"SearchViewController"];
    }
    return _VCArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView AtIndexpath:indexPath WithTitle:_itemArr[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //使用 Storyboard 时可不用在故事板连线可以通过 storyBoardID 来获取对应的VC
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController*viewContr=nil;
    
    //在这里使用@ try 语法捕获异常并做异常处理,即一种方法行不通时,调用第二种方法完成 viewController 的创建
//    @try {
//            viewContr=[storyboard instantiateViewControllerWithIdentifier:self.VCArr[indexPath.row]];
//    }@catch (NSException *exception) {
        Class c=NSClassFromString(self.VCArr[indexPath.row]);
        viewContr=[[c alloc]init];
//    }

    [self.navigationController pushViewController:viewContr animated:YES];
}


@end
