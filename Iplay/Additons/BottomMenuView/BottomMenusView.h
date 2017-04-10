//
//  BottomMenusView.h
//  Iplay
//
//  Created by 推凯 on 2017/4/7.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BottomMenusView;

@protocol BottomMenusViewDelegate <NSObject>

-(void)BottomMenusView:(BottomMenusView*)bottomView didClickedBtnWithTag:(NSInteger)tag;

@end

@interface BottomMenusView : UIView
@property(nonatomic,weak)id<BottomMenusViewDelegate>delegate;
/*
 一步构造方法
 */

-(instancetype)initWithFrame:(CGRect)frame Titles:(NSArray*)titles NormalImages:(NSArray*)normalImages SelectImages:(NSArray*)selectedImages;
@end
