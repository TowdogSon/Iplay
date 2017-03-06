//
//  ShopCartModel.m
//  Iplay
//
//  Created by 推凯 on 2017/3/5.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "ShopCartModel.h"
@implementation RootClass

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    
    return @{@"buyers_data" : [BuyersData class]};
}

@end

@implementation BuyersData

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"prod_list" : [ProdList class]};
}
@end


@implementation ProdList

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"model_detail" : [ModelDetail class]};
}

@end



@implementation ModelDetail


@end
