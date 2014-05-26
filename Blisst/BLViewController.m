//
//  BLViewController.m
//  Blisst
//
//  Created by Andrew Breckenridge on 5/25/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import "BLViewController.h"

@interface BLViewController () <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *listArray;

- (IBAction)addButtonPressed:(id)sender;

@end

@implementation BLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.listArray = [self displayContent];
    
    NSMutableArray *mutable = [[NSMutableArray alloc] initWithArray:self.listArray];
    BLListObject *list = [[BLListObject alloc] init];
    list.name = @"CoolList";
    list.numOfTasks = @8;
    list.numOfCompleted = @4;
    
    [mutable addObject:list];
    self.listArray = [mutable mutableCopy];
    [self writeContent:self.listArray];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];
}


#pragma mark - UIAlertView Methods

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
        
        
        
        NSMutableArray *mutable = [[NSMutableArray alloc] initWithArray:self.listArray];
        [mutable addObject:list];
        self.listArray = [mutable mutableCopy];
        [self writeContent:self.listArray];
    }
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *mutable = [[NSMutableArray alloc] initWithArray:self.listArray];
        [mutable removeObjectAtIndex:indexPath.row];
        self.listArray = [mutable mutableCopy];
        [self writeContent:self.listArray];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"THese many things, %lu", (unsigned long)[[self.listArray mutableCopy] count]);
    return [self.listArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"CellID";
    NSLog(@"Celforrowatindexpath, %@", indexPath);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        cell.contentView.backgroundColor = [UIColor whiteColor];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, cell.frame.size.height+24, (self.view.bounds.size.width)*([[[self.listArray objectAtIndex:indexPath.row] numOfCompleted] floatValue]/[[[self.listArray objectAtIndex:indexPath.row] numOfTasks] floatValue]), 3)];
        
        NSLog(@"num is %f", ([[[self.listArray objectAtIndex:indexPath.row] numOfCompleted] floatValue]/[[[self.listArray objectAtIndex:indexPath.row] numOfTasks] floatValue]));
        
        lineView.backgroundColor = [UIColor colorWithRed:105/255.0f green:181/255.0f blue:171/255.0f alpha:1.0f];
        [cell.contentView addSubview:lineView];
        UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-50, 10, 50, 50)];
        countLabel.text = [NSString stringWithFormat:@"%@/%@", [[self.listArray objectAtIndex:indexPath.row] numOfTasks], [[self.listArray objectAtIndex:indexPath.row] numOfCompleted]];
        [cell.contentView addSubview:countLabel];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"• %@",[[self.listArray objectAtIndex:indexPath.row] name]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    //BLTaskTableViewController *tVC = [[BLTaskTableViewController alloc] init];
    //[self.navigationController pushViewController:tVC animated:YES];
}

#pragma mark - IO

- (NSArray *)displayContent {
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/db", documentsDirectory];
    NSArray *content = [[NSArray alloc] initWithContentsOfFile:fileName];
    return content;
}

- (void)writeContent:(NSArray *)content {
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/db",
                          documentsDirectory];
    //save content to the documents directory
    [content writeToFile:fileName atomically:YES];
    self.listArray = [[NSMutableArray alloc] initWithArray:content];
    [self.tableView reloadData];
    NSLog(@"%@", self.listArray);
}


@end
