//
//  BLTask.h
//  Blist
//
//  Created by Andrew Breckenridge on 5/24/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLTask : NSObject

@property (nonatomic, strong) NSUUID *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *parent;
@property (nonatomic, assign) BOOL *completed;
@property (nonatomic, strong) NSNumber *priority;

@end
