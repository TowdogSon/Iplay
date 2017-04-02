//
//  TableViewCell.m
//  Iplay
//
//  Created by 推凯 on 2017/2/16.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "TableViewCell.h"


@interface TableViewCell()
@property(strong,nonatomic)UILabel*label1;
@property(strong,nonatomic)UILabel*label2;

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
        
        
        _label2=[[UILabel alloc]init];
        [self addSubview:_label2];
        
        [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_label1);
            make.left.mas_equalTo(_label1.bounds.origin.x+30);
            make.size.mas_equalTo(CGSizeMake(screenWidth-(_label1.bounds.origin.x+40),30));
        }];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        _label2.backgroundColor=[UIColor randomColor];
        _label2.layer.shadowColor = [UIColor blueColor].CGColor;//阴影颜色
        _label2.layer.shadowOffset = CGSizeMake(4, 4);//偏移距离
        _label2.layer.shadowOpacity = 0.5;//不透明度
        _label2.layer.shadowRadius = 2.0;//半径
        _label2.layer.cornerRadius=5;
        _label2.layer.masksToBounds=YES;
        _label2.opaque=0.5;
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
