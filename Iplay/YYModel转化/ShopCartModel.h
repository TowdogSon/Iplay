//
//  ShopCartModel.h
//  Iplay
//
//  Created by 推凯 on 2017/3/5.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RootClass : NSObject

@property (nonatomic, strong) NSArray * buyers_data;

@end


@interface BuyersData : NSObject

@property (nonatomic, strong) NSString * buyer_id;
@property (nonatomic, assign) NSInteger last_update_ts;
@property (nonatomic, strong) NSString * nick_name;
@property (nonatomic, strong) NSArray * prod_list;
@property (nonatomic, strong) NSString * user_avatar;
@end

@interface ProdList : NSObject

@property (nonatomic, assign) NSInteger cn_price;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSArray * model_detail;
@property (nonatomic, assign) NSInteger order_price;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, strong) NSString * prod_id;
@property (nonatomic, strong) NSString * remark;
@property (nonatomic, assign) NSInteger tax;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger trans_free;
@end

@interface ModelDetail : NSObject

@property (nonatomic, strong) NSString * key;
@property (nonatomic, strong) NSString * type_name;
@property (nonatomic, strong) NSString * value;
@end
