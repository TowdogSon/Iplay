//
//  BottomMenusView.m
//  Iplay
//
//  Created by 推凯 on 2017/4/7.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "BottomMenusView.h"
#import "BottomMenuButton.h"
#import "KTBarButton.h"
const NSInteger Begin_Tag=1000;
@interface BottomMenusView()
@property(strong,nonatomic)KTBarButton*selectedBtn;

@end
@implementation BottomMenusView


-(instancetype)initWithFrame:(CGRect)frame Titles:(NSArray*)titles NormalImages:(NSArray*)normalImages SelectImages:(NSArray*)selectedImages
{
    if (self=[super initWithFrame:frame]) {

        [self setUpUIWithTitles:titles NormalImages:normalImages SelectImages:selectedImages];
        self.backgroundColor=RGB_COLOR(41, 41, 41);
    }

    return self;
}

-(void)setUpUIWithTitles:(NSArray*)titles NormalImages:(NSArray*)normalImages SelectImages:(NSArray*)selectedImages
{
    CGFloat width=screenWidth/titles.count;
    
    for (int i=0; i<titles.count; i++) {
        
        KTBarButton * btn = [[KTBarButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0) title:titles[i] normalImage:normalImages[i] selectedImage:selectedImages[i]];
        
        btn.tag= Begin_Tag+i;
        [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        if (i==0) {
            btn.selected=YES;
            _selectedBtn=btn;
            _selectedBtn.label.textColor=RGB_COLOR(240, 199, 74);
            _selectedBtn.image.image=[UIImage imageNamed:_selectedBtn.selectedImage];
        }
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(10);
            make.bottom.mas_equalTo(self.mas_bottom).offset(0);
            make.width.mas_equalTo(width);
            make.left.mas_equalTo(width*i);
        }];
        [btn layoutIfNeeded];
    }
}

-(void)clickItem:(KTBarButton*)sender
{
    if (sender.tag==_selectedBtn.tag) {
        return;
    }else
    {
        _selectedBtn.selected=NO;
        _selectedBtn.label.textColor=[UIColor whiteColor];
        _selectedBtn.image.image=[UIImage imageNamed:_selectedBtn.normalImage];
        _selectedBtn=sender;
        _selectedBtn.selected=YES;
        _selectedBtn.label.textColor=RGB_COLOR(240, 199, 74);
        _selectedBtn.image.image=[UIImage imageNamed:_selectedBtn.selectedImage];
    }
    //代理执行方法
    if (self.delegate&&[self.delegate respondsToSelector:@selector(BottomMenusView:didClickedBtnWithTag:)]) {
        [self.delegate BottomMenusView:self didClickedBtnWithTag:sender.tag];
    }
}
@end
