//
//  KTBaseViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/3/30.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTBaseViewController.h"

@interface KTBaseViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView*table;

@end

@implementation KTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor randomColor];
    [self setUpTableView];

}

-(void)setUpTableView
{
    CGRect tableRect=CGRectMake(0, 0, screenWidth, screenHeight-44);
    self.table=[[UITableView alloc]initWithFrame:tableRect style:UITableViewStylePlain];
    self.table.delegate=self;
    self.table.dataSource=self;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    [self.view addSubview:self.table];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
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
