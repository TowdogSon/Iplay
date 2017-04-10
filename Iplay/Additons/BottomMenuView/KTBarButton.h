//
//  KTBarButton.h
//  Iplay
//
//  Created by 推凯 on 2017/4/7.
//  Copyright © 2017年 TK. All rights reserved.
//

/***************************
 该控件为自定义底部 tabbarButton,imageView和 label都可以高度自定义,但使用起来比较麻烦,尤其是在 normal 和 selected 状态切换的时候需要在父视图中增加判断来手动改变状态************************/
#import <UIKit/UIKit.h>

@interface KTBarButton : UIButton

@property(strong,nonatomic)UIImageView*image;
@property(strong,nonatomic)UILabel*label;
@property(strong,nonatomic)NSString*normalImage;
@property(strong,nonatomic)NSString*selectedImage;
-(instancetype)initWithFrame:(CGRect)frame title:(NSString*)title normalImage:(NSString*)normalImage selectedImage:(NSString*)selectedImage;
@end
