//
//  BAListObject.h
//  Blisst
//
//  Created by Andrew Breckenridge on 6/2/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAListObject : NSManagedObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *numOfTasks;
@property (nonatomic, strong) NSNumber *numOfCompleted;
@property (nonatomic, assign) BOOL *completed;
@property (nonatomic, strong) NSArray *tasks;

@end
