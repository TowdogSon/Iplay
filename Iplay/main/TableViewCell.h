//
//  TableViewCell.h
//  Iplay
//
//  Created by 推凯 on 2017/2/16.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

-(void)configCellWithTitle:(NSString*)title AtIndexpath:(NSIndexPath*)indexPath;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
