//
//  KTAlipayViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/2/21.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTAlipayViewController.h"
#import "YGPayByAliTool.h"

@interface KTAlipayViewController ()

@end

@implementation KTAlipayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)payMe:(id)sender {
    
    /**
     *  支付下单
     *
     *  @param subjects   商品标签
     *  @param body       商品描述
     *  @param price      商品价格
     *  @param orderId    商品ID         商家自行拟定
     *  @param partner    商户partner   partner可于seller相同
     *  @param seller     商户seller
     *  @param privateKey 商户私钥
     */
    // 以下参数均为美衣共享商户信息（届时替换为自己的项目商户信息即可）
    
    //支付宝 SDK集成可以直接看文档,然后用封装的类实现支付功能,需要创建公钥私钥并完成上传,还需要商户签约
    [YGPayByAliTool payByAliWithSubjects:@"向魔法衣橱订单支付1分钱" body:nil price:0.01 orderId:@"1" partner:@"2088121086561611" seller:@"2088121086561611" privateKey:@"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAL5Or+lEhD9qWrw5o6DGbFzoN22A9ThksXI8+4rdKGUNfD8flt6ibB4SPK/7dirn1MqEqyYxrxqgSDB0aYvF8CLSPppaquvlo07j76Wu4OYNrpBdEAktRCXoWNaG7mThuTPQShnrafByToKENuO13/31tIo9iTG29sbN2IG9HDZNAgMBAAECgYBh5Lg4ljYxKNRj3oJ9QZScdheNDLkXuTROP3Bljj4pPTacgfNpssNK9LajEAdJKtgbFQO1MfmRCMIZqshgTgGoA0N6l5zBFrl/2/RQl8iOlWlTK6tRgHVEDZ9WO58X2GSbr7V4Z5Ju/3VdR+FT6gEU6VWjW4UQ5Ax/P7iddaCgAQJBAPfRsTxCg6Z5CUHfxnHWHQqTi/ItDgaIOxJb+X0udUWhHgaVwbnnRSzbHNUqdXHxczYzxQ798pDNPCAZ/3SWRoECQQDElvdAAeq2CHHwZcxvhDyS5rUKTklt4atkHeHQmrsQo6hIqbZg0CLQDIL8dFhPMX8gYTSWmvKI9h9NNrGPX0HNAkEArIdGNsev0+QL99qM04/XJBfYpD+Ntip9xahWpzoC1vj2aGs2NfC2jiX1ispGfY81QJUGKgvOJdVceJTg7g/5AQJAbFYVo3xq8C3vPF+dLcdd6kahdjB2XsuCPAYLr33VoPHPh1ufWfLZfHWoqZ8kG2BXgmyPIn/5MGkSDucZKr1/8QJBAMoIAPPtUOtJ3eLXk/F2wAfyw/9U5BfIbw43XeLoibvnfXVLM5TmNhgr0GyUGUkyZJZngF+qnJbjRsV6V7xC0Mk=" success:^(NSDictionary *info) {
        // 手机没有安装支付宝自动调用网页版
        // 支付完成后调用  打印查看是否支付成功
        NSLog(@"info = %@",info);
        
    }];
 
    
    
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
