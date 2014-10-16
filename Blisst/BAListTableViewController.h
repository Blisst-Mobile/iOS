//
//  BAListTableViewController.h
//  Blisst
//
//  Created by Andrew Breckenridge on 6/2/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BAAppDelegate.h"

#import "BAListObject.h"
#import "BATaskObject.h"

@interface BAListTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) BAAppDelegate *appDelegate;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)addButtonHit:(id)sender;

@end
