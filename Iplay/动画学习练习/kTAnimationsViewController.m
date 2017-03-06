//
//  kTAnimationsViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/3/3.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "kTAnimationsViewController.h"

@interface kTAnimationsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation kTAnimationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
