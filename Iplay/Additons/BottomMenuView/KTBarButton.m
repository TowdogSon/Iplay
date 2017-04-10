//
//  KTBarButton.m
//  Iplay
//
//  Created by 推凯 on 2017/4/7.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTBarButton.h"

@interface KTBarButton()

@end
@implementation KTBarButton

-(instancetype)initWithFrame:(CGRect)frame title:(NSString*)title normalImage:(NSString*)normalImage selectedImage:(NSString*)selectedImage
{
    
    if (self=[super initWithFrame:frame]) {
        
        self.normalImage=normalImage;
        self.selectedImage=selectedImage;
    
        _image=[[UIImageView alloc]init];
        _image.image=[UIImage imageNamed:self.normalImage];
        [self addSubview:_image];
        
        _label=[[UILabel alloc]init];
        _label.font=[UIFont systemFontOfSize:8];
        _label.textColor=[UIColor whiteColor];
        _label.textAlignment=NSTextAlignmentCenter;
        _label.text=title;
        [self addSubview:_label];

    }
    return  self;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.imageView removeFromSuperview];//移除控件本身的 imageView
    
    CGFloat width=self.height/2;

    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo((self.width-width)/2);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(width);
    }];
    _image.contentMode = UIViewContentModeScaleAspectFit;

    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(width+2);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(20);

    }];

    

}


@end
