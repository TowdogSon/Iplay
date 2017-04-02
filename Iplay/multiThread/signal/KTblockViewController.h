//
//  KTblockViewController.h
//  Iplay
//
//  Created by 推凯 on 2017/3/29.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^KTblock)(NSString*str);
@interface KTblockViewController : UIViewController
@property(nonatomic,copy)KTblock block;
@end
