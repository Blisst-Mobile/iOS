//
//  BLTaskTableViewController.h
//  Blisst
//
//  Created by Andrew Breckenridge on 5/25/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BLListObject.h"
#import "BLTaskObject.h"

#import "BLViewController.h"

@interface BLTaskTableViewController : UITableViewController

- (id)initWithList:(NSArray *)list;

@end
