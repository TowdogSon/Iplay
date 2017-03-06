//
//  ArInfo+CoreDataProperties.h
//  
//
//  Created by 推凯 on 2017/2/19.
//
//

#import "ArInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ArInfo (CoreDataProperties)

+ (NSFetchRequest<ArInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *myid;
@property (nullable, nonatomic, copy) NSString *myname;

@end

NS_ASSUME_NONNULL_END
