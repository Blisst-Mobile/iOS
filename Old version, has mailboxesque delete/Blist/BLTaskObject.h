//
//  BLTaskObject.h
//  Blist
//
//  Created by Andrew Breckenridge on 5/25/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLListObject.h"

@interface BLTaskObject : NSObject

@property (nonatomic, strong) NSUUID *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL completed;
@property (nonatomic, strong) NSDate *date;

@end
