//
//  TableViewCell.h
//  Iplay
//
//  Created by 推凯 on 2017/2/16.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView AtIndexpath:(NSIndexPath*)indexPath WithTitle:(NSString*)title;

@end
