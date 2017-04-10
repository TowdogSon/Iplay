//
//  BadgeButton.m
//  Iplay
//
//  Created by 推凯 on 2017/4/6.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "BadgeButton.h"

@interface BadgeButton()
/** 显示按钮角标的label */
@property (nonatomic,strong) UILabel *badgeLabel;


@end
@implementation BadgeButton

#pragma mark - 构造方法
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // button属性设置
        self.clipsToBounds = NO;
        
        //------- 角标label -------//
        self.badgeLabel = [[UILabel alloc]init];
        [self addSubview:self.badgeLabel];
        self.badgeLabel.backgroundColor = [UIColor colorWithHexString:@"d51619"];
        self.badgeLabel.font = [UIFont systemFontOfSize:10];
        self.badgeLabel.textColor = [UIColor whiteColor];
        self.badgeLabel.layer.cornerRadius = 6;
        self.badgeLabel.clipsToBounds = YES;
        
        //------- 建立角标label的约束 -------//
        [self.badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(-3);
            make.bottom.mas_equalTo(self.titleLabel.mas_top).mas_offset(8);
            make.height.mas_equalTo(12);
        }];
    }
    return self;
}

#pragma mark - 显示角标
/**
 显示角标
 
 @param badgeNumber 角标数量
 */
- (void)showBadgeWithNumber:(NSInteger)badgeNumber{
    self.badgeLabel.hidden = NO;
    // 注意数字前后各留一个空格，不然太紧凑
    self.badgeLabel.text = [NSString stringWithFormat:@" %ld ",badgeNumber];
}

#pragma mark - 隐藏角标
/** 隐藏角标 */
- (void)hideBadge{
    self.badgeLabel.hidden = YES;
}

#pragma mark - 设置按钮的选中状态
/** 设置按钮的选中状态 */
- (void)setSelected:(BOOL)selected{
    if (selected) {
        [self setTitleColor:[UIColor colorWithHexString:@"d51619"] forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }else{
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont systemFontOfSize:15]];
    }
}


@end
