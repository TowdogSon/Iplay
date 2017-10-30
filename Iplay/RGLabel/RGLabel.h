//
//  RGLabel.h
//  Iplay
//
//  Created by tuikai on 2017/10/27.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KInnerPace 10
#define KimageSize 20
@interface RGLabel : UIView

/**
 内容展示的模式

 - DisplayModeImageLeft: 图片在左边,
 - DisplayModeImageRight: 图片在右边
 */
typedef NS_ENUM(NSInteger,DisplayMode){

  DisplayModeImageLeft,
  DisplayModeImageRight

};


//properties

@property(nonatomic,strong)UIImage*image;
@property(nonatomic,strong)NSString*text;
@property(nonatomic,strong)UIFont*fond;
@property(nonatomic,strong)UIColor*textColor;
@property(nonatomic,assign)DisplayMode displayMode; //选择内容呈现的模式,默认为imageLeft

@end
