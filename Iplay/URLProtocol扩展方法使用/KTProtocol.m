//
//  KTProtocol.m
//  Iplay
//
//  Created by 推凯 on 2017/3/8.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTProtocol.h"


@interface KTProtocol()<NSURLSessionDelegate>

@end
@implementation KTProtocol

+(BOOL)canInitWithRequest:(NSURLRequest *)request
{
    return  YES;
}
+(NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request
{
    return request;
}

-(void)stopLoading
{
    NSLog(@"%s",__func__);

}
-(void)startLoading
{
    NSLog(@"%s",__func__);
}
@end
