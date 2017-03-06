//
//  ViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/2/15.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+WebCache.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    }

- (IBAction)clearMemAndDisk:(id)sender {
    
    [[SDImageCache sharedImageCache]clearMemory];
    [[SDImageCache sharedImageCache]clearDiskOnCompletion:nil];
}


- (IBAction)addImage:(id)sender {
    
    //SDWebImage加载图片流程,加载网路图片时,先检测内存有无图片,若无,检测本地硬盘是否存在图片,若无,加如下载队列(开辟线程),下载完成回调方法进行图片显示
    
    
    NSURL* imagePath1 = [NSURL URLWithString:@"http://pic6.huitu.com/res/20130116/84481_20130116142820494200_1.jpg"];

    [self.imageView sd_setImageWithURL:imagePath1 placeholderImage:[UIImage imageNamed:@"panda"] options:SDWebImageProgressiveDownload  ];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self clearMemAndDisk:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
