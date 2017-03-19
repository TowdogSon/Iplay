//
//  KTOperation.h
//  Iplay
//
//  Created by 推凯 on 2017/3/18.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^myBlock)();//初始化使用的 block

@interface KTOperation : NSOperation

@property(nonatomic,copy)myBlock myBlock;
-(instancetype)init;

-(instancetype)initWithBlock:(myBlock)block;


@end
