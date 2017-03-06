//
//  CoreDataViewController.h
//  Iplay
//
//  Created by 推凯 on 2017/2/19.
//  Copyright © 2017年 TK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataViewController : UIViewController


@property (strong, nonatomic) NSManagedObjectContext *context;
@property(strong,nonatomic)NSString*str;
@end
