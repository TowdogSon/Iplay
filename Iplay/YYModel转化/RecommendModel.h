//
//  RecommendModel.h
//  Iplay
//
//  Created by 推凯 on 2017/3/5.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface relateProducts : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, strong) NSString * shareUrl;


@end


@interface singleProduct : NSObject
@property (nonatomic, assign) NSInteger cnPrice;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, assign) NSInteger orderPrice;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, assign) NSInteger prodId;
@property (nonatomic, assign) NSInteger tax;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger transFee;
@property (nonatomic, strong) NSString * userId;
@end
