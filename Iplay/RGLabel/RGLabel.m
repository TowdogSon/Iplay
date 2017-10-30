//
//  RGLabel.m
//  Iplay
//
//  Created by tuikai on 2017/10/27.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "RGLabel.h"

@interface RGLabel(){

    YYLabel *label ;
    UIImageView*imageView;

}
@end


@implementation RGLabel

//liftCycle

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){

        [self initLabel];
    }
    return self;
}

-(void)initLabel{

    _image = nil ;
    _text  = nil;
    _fond = [UIFont systemFontOfSize:17];
    _textColor = [UIColor blackColor];
    _displayMode = DisplayModeImageLeft;

}

-(void)layoutSubviews{
    [super layoutSubviews];

    NSAssert(_text, @"请提供RGLabel要显示的信息,否则控件将不显示任何内容");

        label = [[YYLabel alloc]init];
        label.textColor=_textColor;
        label.text=_text;
        label.font=_fond;
        [self addSubview:label];

        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(KInnerPace);
            make.right.mas_equalTo(KInnerPace);
        }];

    if (_image) {
        imageView = [[UIImageView alloc]initWithImage:_image];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.mas_equalTo(KInnerPace);
            make.width.height.mas_equalTo(KimageSize);
        }];

        if (_displayMode == DisplayModeImageRight) {
            [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(KInnerPace);
                make.centerY.equalTo(self);
                make.width.height.mas_equalTo(KimageSize);

            }];
            [label mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(imageView.mas_left).offset(-KInnerPace);
                make.centerY.mas_equalTo(self);

            }];
        }else{

            [label mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(KInnerPace);
                make.centerY.mas_equalTo(self);
                make.left.mas_equalTo(imageView.mas_right).offset(KInnerPace);
            }];
        }

    }



}

@end
