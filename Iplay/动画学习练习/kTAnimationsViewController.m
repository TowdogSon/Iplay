//
//  kTAnimationsViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/3/3.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "kTAnimationsViewController.h"
#import "KTRedraw.h"
#import "CustomTextField.h"
@interface kTAnimationsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong)UIImageView*imageView2;
@property(nonatomic,strong)UIButton*button;

@end

@implementation kTAnimationsViewController

#pragma mark Getters

-(UIButton *)button
{
    if (!_button) {
        _button=[UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"开始动画" forState:UIControlStateNormal];
        _button.tag=1001;
        [_button setTitleColor:[UIColor randomColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
-(UIImageView *)imageView2{
    
    if (!_imageView2) {
        _imageView2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HeadPic"]];
    }
    return _imageView2;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self layoutViews];
}

-(void)layoutViews{
    //此方法为布局方法
    
    [self.view addSubview:self.imageView2];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view).centerOffset(CGPointMake(0, -100));
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];

    [self.view addSubview:self.button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        
    }];


    CustomTextField *text=[[CustomTextField alloc]initWithFrame:CGRectMake(100, 400, 200, 100) placeholder:@"请输入..." clear:YES leftView:nil fontSize:17];
    [self.view addSubview:text];
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, 100));
    }];
}

-(void)buttonClicked:(UIButton*)sender
{
    
    //xcode 4以后使用 block 代替 uiviewBegin和 UIViewCommit,两者实现效果一致
    [UIView animateWithDuration:1 animations:^{
        [UIView setAnimationRepeatCount:1];
        
        CGAffineTransform xform=CGAffineTransformMakeScale(0.5, 0.5);
        // Make the animatable changes.
        _imageView2.transform=xform;
        CGAffineTransform xform2=CGAffineTransformMakeRotation(M_PI);
        _imageView2.transform=xform2;
        
    }];
    
}

- (IBAction)startAnimate:(id)sender {
    
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,50,screenHeight-50);
    CGPathAddCurveToPoint(thePath,NULL,
                          (screenWidth)/4,0,
                          (screenWidth)/2,0,
                          (screenWidth)/2,screenHeight-25);
    CGPathAddCurveToPoint(thePath,NULL,
                          (screenWidth)/2,0,
                          screenWidth-(screenWidth)/4,0,
                          screenWidth-25,screenHeight-25);
    
    CAKeyframeAnimation * theAnimation;
    
    // Create the animation object, specifying the position property as the key path.
    theAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path=thePath;
    theAnimation.duration=5.0;
    
    // Add the animation to the layer.
    [self.imageView.layer addAnimation:theAnimation forKey:@"position"];
    self.imageView.frame=CGRectMake(screenWidth-50, screenHeight-50, 50, 50);
}

@end
