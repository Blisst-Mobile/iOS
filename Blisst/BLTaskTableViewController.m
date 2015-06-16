//
//  BLTaskTableViewController.m
//  Blisst
//
//  Created by Andrew Breckenridge on 5/25/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import "BLTaskTableViewController.h"

@interface BLTaskTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (nonatomic, strong) NSArray *taskArray;

- (IBAction)addButtonPressed:(id)sender;

@end

@implementation BLTaskTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithList:(NSArray *)list
{
    self = [super init];
    if (self) {
        self.taskArray = list;
        
        for (BLTaskObject *task in list) {
            NSLog(@"Tasks are %@", [task name]);
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.taskArray = [self displayContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"THere are %lu tasks", (unsigned long)[self.taskArray count]);
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"CellID";
    NSLog(@"Celforrowatindexpath, %@", indexPath);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[self.taskArray objectAtIndex:indexPath.row] completed]) {
            cell.textLabel.text = @"some task that is true";
        } else {
            cell.textLabel.text = @"some task that is not true";
        }
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *mutable = [[NSMutableArray alloc] initWithArray:self.taskArray];
        [mutable removeObjectAtIndex:indexPath.row];
        self.taskArray = [mutable mutableCopy];
        [self writeContent:self.taskArray];
    }
}

- (void)addButton:(UIBarButtonItem *)button {
    NSLog(@"Button was hit");
    
}

#pragma mark - IO

- (NSArray *)displayContent {
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/taskDB", documentsDirectory];
    NSArray *content = [[NSArray alloc] initWithContentsOfFile:fileName];
    return content;
}

- (void)writeContent:(NSArray *)content {
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/taskDB",
                          documentsDirectory];
    //save content to the documents directory
    [content writeToFile:fileName atomically:YES];
    self.taskArray = [[NSMutableArray alloc] initWithArray:content];
    [self.tableView reloadData];
    NSLog(@"%@", self.taskArray);
}

- (IBAction)addButtonPressed:(id)sender {
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Add List" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert addButtonWithTitle:@"Done"];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 1) {  //Login
        UITextField *username = [alertView textFieldAtIndex:0];
        NSLog(@"username: %@", username.text);
        BLListObject *list = [[BLListObject alloc] init];
        list.name = username.text;
        list.numOfTasks = @8;
        list.numOfCompleted = @2;
        
        NSMutableArray *taskList = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 8; i++) {
            BLTaskObject *task = [[BLTaskObject alloc] init];
            task.name = @"This amazing task";
            task.completed = NO;
            [taskList addObject:task];
        }
        
        list.tasks = [taskList mutableCopy];
        
        
        
        NSMutableArray *mutable = [[NSMutableArray alloc] initWithArray:self.taskArray];
        [mutable addObject:list];
        self.taskArray = [mutable mutableCopy];
        [self writeContent:self.taskArray];
    }
}
@end
