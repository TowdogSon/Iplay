//
//  SortTool.h
//  Iplay
//
//  Created by 推凯 on 2017/3/19.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KTSortType)
{
    KTSortTypeDecending,//排序结果为降序
    KTSortTypeAsending  //排序结果为升序

};

@interface SortTool : NSObject

//创建单例实例
+(instancetype)shareInstance;
//通过冒泡排序

-(NSArray*)sortByBubbleWithArray:(NSArray*)arr option:(KTSortType)sortType;

@end
