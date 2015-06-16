//
//  BLListObject.h
//  Blist
//
//  Created by Andrew Breckenridge on 5/25/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLListObject : NSObject

@property (nonatomic, strong) NSUUID *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *numOfTasks;
@property (nonatomic, strong) NSNumber *numOfCompleted;
@property (nonatomic, strong) NSArray *tasks;

@end
