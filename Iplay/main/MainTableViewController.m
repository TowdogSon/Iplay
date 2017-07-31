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
        _itemArr= @[@"动画学习练习",@"YYModel 转化",@"多线程",@"部分圆角操作",@"自定义 tabbarVC",@"CustomTest",@"搜索",@"JS调用OC"];
    }
    return _itemArr;
}

-(NSArray *)VCArr
{
    if (_VCArr==nil) {
  _VCArr=@[@"kTAnimationsViewController",@"KTTestModelViewController",@"KTSignalViewController",@"PartCornerViewController",@"KTTabBarViewController",@"TestViewController",@"SearchViewController",@"JSViewController"];
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

    UIViewController*viewContr=nil;
    Class c=NSClassFromString(self.VCArr[indexPath.row]);
    viewContr=[[c alloc]init];

    [self.navigationController pushViewController:viewContr animated:YES];
}


@end
