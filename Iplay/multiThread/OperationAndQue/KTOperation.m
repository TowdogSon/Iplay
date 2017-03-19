//
//  KTOperation.m
//  Iplay
//
//  Created by 推凯 on 2017/3/18.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "KTOperation.h"

@implementation KTOperation

-(instancetype)init
{
   return  [self initWithBlock:nil];
}
-(instancetype)initWithBlock:(myBlock)block
{
    
    
    if (self=[super init]) {
        _myBlock=block;
    }
    return self;
}

-(void)start
{
    _myBlock();
    NSLog(@"%s",__func__);
    [super start];
}
@end
