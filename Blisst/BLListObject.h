//
//  BLListObject.h
//  Blisst
//
//  Created by Andrew Breckenridge on 5/25/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLListObject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL *completed;
@property (nonatomic, assign) NSNumber *numOfTasks;
@property (nonatomic, assign) NSNumber *numOfCompleted;
@property (nonatomic, strong) NSArray *tasks;

@end
