//
//  TableViewCell.m
//  Iplay
//
//  Created by 推凯 on 2017/2/16.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "TableViewCell.h"

#import "KTLabel.h"
@interface TableViewCell()
@property(strong,nonatomic)UILabel*label1;
@property(strong,nonatomic)KTLabel*label2;

@end
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView AtIndexpath:(NSIndexPath*)indexPath WithTitle:(NSString*)title
{
    static NSString *ID = @"KTMainCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.label2.text=title;
    cell.label1.text=[NSString stringWithFormat:@"%ld",indexPath.row];

    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _label1=[[UILabel alloc]init];
        [self addSubview:_label1];
        
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.lessThanOrEqualTo(@5);
            make.left.lessThanOrEqualTo(@5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        
        _label2=[[KTLabel alloc]init];
        [self addSubview:_label2];
        
        [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_label1);
            make.left.mas_equalTo(_label1.bounds.origin.x+30);
            make.size.mas_equalTo(CGSizeMake(screenWidth-(_label1.bounds.origin.x+40),30));
        }];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        _label2.backgroundColor=[UIColor randomColor];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
