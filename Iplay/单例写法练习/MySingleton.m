//
//  MySingleton.m
//  Iplay
//
//  Created by 推凯 on 2017/2/15.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "MySingleton.h"
static MySingleton*Singleton;

@implementation MySingleton


//这里是标准的单例写法,这样写保证 init,copy 各种渠道获取单例都是同一个对象
+(instancetype)shareInstance
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Singleton=[[ super  allocWithZone:NULL] init];
    });
    return  Singleton;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [ MySingleton shareInstance];
}


-(id)copyWithZone:(struct _NSZone*)zone{
    
    return [MySingleton shareInstance];
    
}








@end
