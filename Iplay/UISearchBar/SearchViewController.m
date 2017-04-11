//
//  SearchViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/4/11.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "SearchViewController.h"
#import <PYSearch.h>
@interface SearchViewController ()<PYSearchViewControllerDelegate>
@property(nonatomic,strong)PYSearchViewController*searchVC;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUp];

    
}
-(void)setUp{
    
    _searchVC=[PYSearchViewController searchViewControllerWithHotSearches:@[@"Objective-c",@"swift"] searchBarPlaceholder:@"请输入关键词..." didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        
        //code when you taped search
        
        NSLog(@"点击搜索%@",searchText);
        
    }];
    _searchVC.delegate=self;
    _searchVC.hotSearchStyle=PYHotSearchStyleColorfulTag;
    _searchVC.searchHistoryStyle=PYSearchHistoryStyleBorderTag;
    UINavigationController*nv=[[UINavigationController alloc]initWithRootViewController:_searchVC];
    [self presentViewController:nv animated:NO completion:nil];
}


#pragma mark SearchViewControllerDelegate
-(void)didClickCancel:(PYSearchViewController *)searchViewController
{
    //自身 viewController pop回主页面, searchViewController 自身 dismiss不代表 selfpop

    [self.navigationController popViewControllerAnimated:NO];
}

-(void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText
{
    NSLog(@"searchText--%@",searchText);
    
    _searchVC.searchSuggestions=@[@"requestValues1",@"requestValues2"];
    
}
@end
