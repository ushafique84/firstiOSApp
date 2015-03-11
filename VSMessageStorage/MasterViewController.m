//
//  MasterViewController.m
//  VSMessageStorage
//
//  Created by Usman Shafique on 1/27/15.
//
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MessagesDoc.h"
#import "MessagesData.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

//ADDING SYNTHESIZE
@synthesize messages = _messages;

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    //ADDING TITLE LINE
    self.title = @"ZDM Messages";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

/*  Modifying prepareForSegue()
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    /*if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }*/
    
    DetailViewController *controller;
    if ([[segue destinationViewController] isKindOfClass:[UINavigationController class]]) {
        controller = (DetailViewController *)[[segue destinationViewController] topViewController];
    }
    else {
        controller = (DetailViewController *)[segue destinationViewController];
    }
    MessagesDoc *message = [self.messages objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    [controller setDetailItem:message];
    
    /*
    DetailViewController *detailController = segue.destinationViewController;
    printf("+++++++++++))))))");
    NSLog(@"%@", [detailController class]);
    printf("=====================");
    MessagesDoc *message = [self.messages objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailController.detailItem = message;
     */
    
}

#pragma mark - Table View


    //ONLY ONE SECTION SO NEED TO OVERRIDE DEFAULT
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

    //OVERRIDING TO RETURN NUMBER OF OBJECTS IN MESSAGES ARRAY
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.objects.count;
    return _messages.count;
}

    /* OVERRIDING METHOD
     dequeueReusableCellWithIdentifier: returns a reusable cell. For large number of rows, no
     need to create a new cell when new row cycles on screen. Function will just re-use created
     cell that cycled off screen at top imporving performance. If no cell avaialbe to re-use,
     will create a new cell.
     */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageBasicCell"];
    MessagesDoc *message = [self.messages objectAtIndex:indexPath.row];
    cell.textLabel.text = message.data.title;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //MODIFYING CONTENT TO DELETE FROM MESSAGES. ONLY THING CHANGED FROM DEFAULT WAS "_messages" data model
    //SECOND LINE IN IF STATEMENT NOTIFIES TABLE VIEW THAT A ROW HAS BEEN DELETED
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*  Adding didMoveToParentViewController() 
    This will reload the table once user returns back from detail view to master view
    MAY NOT NEED THIS************++++++++++++>>>>>>>>>>>><<<<<<<<<<<<<<<!!!!!!!!!!!!!!========
 

-(void)didMoveToParentViewController:(UIViewController *)parent{
    [self.tableView reloadData];
}*/

@end
