//
//  ArInfo+CoreDataProperties.m
//  
//
//  Created by 推凯 on 2017/2/19.
//
//

#import "ArInfo+CoreDataProperties.h"

@implementation ArInfo (CoreDataProperties)

+ (NSFetchRequest<ArInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ArInfo"];
}

@dynamic myid;
@dynamic myname;

@end
