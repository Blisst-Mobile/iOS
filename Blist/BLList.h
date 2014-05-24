//
//  BLList.h
//  Blist
//
//  Created by Andrew Breckenridge on 5/24/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLList : NSObject

@property (nonatomic, strong) NSUUID *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL *completed;
@property (nonatomic, strong) NSNumber *numOfTasks;
@property (nonatomic, strong) NSNumber *numOfCompletedTasks;

@end
