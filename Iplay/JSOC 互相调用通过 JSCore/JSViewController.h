//
//  JSViewController.h
//  Iplay
//
//  Created by 推凯 on 2017/2/20.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSViewControllerDelegate <JSExport>

-(void)showAlert:(NSString*)str;
-(void)showMessage:(NSString*)str;


@end
@interface JSViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property(strong,nonatomic)JSContext*context;
@end
