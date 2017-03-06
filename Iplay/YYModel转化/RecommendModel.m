//
//  RecommendModel.m
//  Iplay
//
//  Created by 推凯 on 2017/3/5.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "RecommendModel.h"

@implementation relateProducts

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    
    return @{@"list" : [singleProduct class]
            };
}

@end

@implementation singleProduct

@end
