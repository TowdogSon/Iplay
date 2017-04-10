//
//  BottomMenuButtun.m
//  Iplay
//
//  Created by 推凯 on 2017/4/7.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "BottomMenuButton.h"
@implementation BottomMenuButton

-(instancetype)init
{
    //初始化方法必须实现,该方法中无视布局,布局可在 layout方法中重写
    if (self=[super init]) {

        _label=[[UILabel alloc]init];
        _label.textColor=[UIColor whiteColor];
        _label.textAlignment=NSTextAlignmentCenter;
        _label.font=[UIFont systemFontOfSize:8];
        [self addSubview:_label];
    }
    return self;
}
-(void)layoutSubviews
{
    //layoutSubViews 布局子控件方法,重写可实现自定义
    [super layoutSubviews];
//    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.mas_top).offset(-1);
//        make.height.mas_equalTo(self.height/2);
//        make.width.mas_equalTo(self.height/2);
//        make.centerX.mas_equalTo(self.centerX);
//    }];
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;

    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.bottom);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(self.width);
        make.left.mas_equalTo(self.mas_left);
    }];
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect

{
    return CGRectMake(0, 0, 20, 20);
}
@end
