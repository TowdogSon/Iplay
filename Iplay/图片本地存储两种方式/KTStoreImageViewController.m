//
//  KTStoreImageViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/2/28.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTStoreImageViewController.h"

@interface KTStoreImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imagePlist;
@property (weak, nonatomic) IBOutlet UIImageView *imageDoc;

@end

@implementation KTStoreImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)storeByPlist:(id)sender {
    
    self.imagePlist.image=nil;
    NSString*docPath=[UIApplication sharedApplication].documentsPath;
    
    NSString *imagePath = [docPath stringByAppendingPathComponent:@"doc.plist"];
    NSLog(@"%@",docPath);
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    //把图片转换为Base64的字符串
    NSString *image64 = [self encodeToBase64String:@"HeadPic"];
    [arr addObject:image64];
    //写入plist文件
    if ([arr writeToFile:imagePath atomically:YES]) {

        NSArray*imageArr=[NSArray arrayWithContentsOfFile:imagePath];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.imagePlist.image=[self getImage:imageArr.firstObject];
        });
    };

    
}

-(NSString*)encodeToBase64String:(NSString*)imageName
{
    UIImage *originImage = [UIImage imageNamed:imageName];
    
    NSData *data = UIImageJPEGRepresentation(originImage, 1.0f);
    
    NSString *encodedImageStr = [data base64Encoding];
    

    return encodedImageStr;
}

-(UIImage*)getImage:(NSString*)imageString
{
    
    NSData *decodedImageData = [[NSData alloc] initWithBase64Encoding:imageString];
    UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
    return decodedImage;
}

- (IBAction)storeByDocument:(id)sender {
    
    self.imageDoc.image=nil;
    NSString*docPath=[UIApplication sharedApplication].documentsPath;
    
    NSString *imagePath = [docPath stringByAppendingPathComponent:@"doc"];
    
    NSData*imageData=UIImagePNGRepresentation([UIImage imageNamed:@"panda"]);
    
   BOOL isSuccess= [imageData writeToFile:imagePath atomically:YES];
    
    NSLog(@"%@",imagePath);
    
    if (isSuccess) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSData*data=[NSData dataWithContentsOfFile:imagePath];
            self.imageDoc.image=[UIImage imageWithData:data];
        });
    }
    
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
