//
//  SortTool.m
//  Iplay
//
//  Created by 推凯 on 2017/3/19.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "SortTool.h"

@implementation SortTool

+(instancetype)shareInstance
{
    
    static  id sortTool;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sortTool=[SortTool new];
    });
    
    return sortTool;
    
}

-(NSArray*)sortByBubbleWithArray:(NSArray*)arr option:(KTSortType)sortType{
    
    NSMutableArray*mArr=[[NSMutableArray alloc]initWithArray:arr];
    
    for (int i=0; i<mArr.count-1; i++) {
        for (int j=0; j<mArr.count-1-i; j++) {
            
        BOOL ISAcending=sortType==KTSortTypeAsending?!([mArr[j] integerValue]>[mArr[j+1] integerValue]):[mArr[j] integerValue]>[mArr[j+1] integerValue];
            
        if(!ISAcending)
        {
            NSNumber*temp=[NSNumber numberWithInteger:[mArr[j] integerValue]];
            [mArr replaceObjectAtIndex:j withObject:mArr[j+1]];
            [mArr replaceObjectAtIndex:j+1 withObject:temp];
            
        }

        }
    }

    return mArr;
}


@end
