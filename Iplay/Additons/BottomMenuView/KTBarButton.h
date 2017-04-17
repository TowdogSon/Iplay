//
//  KTBarButton.h
//  Iplay
//
//  Created by 推凯 on 2017/4/7.
//  Copyright © 2017年 TK. All rights reserved.
//

/***************************
 该控件为自定义底部 tabbarButton,imageView和 label都可以高度自定义***********************/
#import <UIKit/UIKit.h>

@interface KTBarButton : UIButton

@property(strong,nonatomic)UIImageView*image;
@property(strong,nonatomic)UILabel*label;
@property(strong,nonatomic)NSString*normalImage;
@property(strong,nonatomic)NSString*selectedImage;
-(instancetype)initWithFrame:(CGRect)frame title:(NSString*)title normalImage:(NSString*)normalImage selectedImage:(NSString*)selectedImage;
@end
