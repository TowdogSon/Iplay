//
//  JSViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/2/20.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "JSViewController.h"

@interface JSViewController ()<UIWebViewDelegate,JSViewControllerDelegate>

@end

@implementation JSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView*web=[[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView=web;
    self.webView.backgroundColor=[UIColor redColor];
    NSString *path = [[[NSBundle mainBundle] bundlePath]  stringByAppendingPathComponent:@"JSCallOC.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    self.webView.delegate=self;
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"log"] = ^() {
        
        NSLog(@"+++++++Begin Log+++++++");
        NSArray *args = [JSContext currentArguments];
        
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        
        JSValue *this = [JSContext currentThis];
        NSLog(@"this: %@",this);
        NSLog(@"-------End Log-------");
        
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    // 打印异常
    self.context.exceptionHandler =
    ^(JSContext *context, JSValue *exceptionValue)
    {
        context.exception = exceptionValue;
        NSLog(@"%@", exceptionValue);
    };
    
    // 以 JSExport 协议关联 native 的方法,通过这个方法可以直接让 JS调用原生的同名方法,调用格式
    /*
                 <input type="button" value="调用原生 showAlert方法" onclick="native.showAlert('这是原生弹出框');" />
     */
    self.context[@"native"] = self;
}


#pragma mark  JSViewControllerDelegate

-(void)showAlert:(NSString *)str
{
    
    UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"提示" message: str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


-(void)showMessage:(NSString *)str
{
    
    NSLog(@"%s-%@",__func__,str);
}

@end
