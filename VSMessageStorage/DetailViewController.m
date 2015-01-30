//
//  DetailViewController.m
//  VSMessageStorage
//
//  Created by Usman Shafique on 1/27/15.
//
//

#import "DetailViewController.h"
#import "MessagesData.h"
#import "MessagesDoc.h"
#import "SVProgressHUD.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

//Synthesize UIDocumentInteractionController
@synthesize documentInteractionController;
@synthesize detailItem = _detailItem;


//ADDING SYNTHESIZE
@synthesize messages = _messages;

/*  IMPLEMENTATION OF openZDM()
    Uses mainBundle to access all files in the main project
    with name message_zdm and of type 'html'
    Also sets up delegate and shows "Open In" menu 
    App selection is handled by openURL()
 
    Class is using 3rd party library called SVProgressHUd
    to display loading icon during long running operations
 
 */
- (IBAction)openZDM:(id)sender {
    //MessagesDoc *message = [self.messages objectAtIndex:indexPath.row];
    
    // Using SVProgressHUD helper class to show a “Loading” GUI with a spinner
    [SVProgressHUD showWithStatus:@"Loading ZDM Message"];
        
    //Load the message opening in the background using Grand Central Dispatch
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
    //Execute the code in this block in the background
    dispatch_async(concurrentQueue, ^{
        NSURL *myFilePath = [NSURL fileURLWithPath:self.detailItem.fileName isDirectory:false];
        //NSURL *myFilePath = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"_zdm" ofType:@"html"] isDirectory:false];
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL: myFilePath];
        self.documentInteractionController.delegate = self;
        self.documentInteractionController.UTI = @"publc.html";
        [self.documentInteractionController presentOpenInMenuFromRect:CGRectZero inView:self.view animated: YES];
        
        //Present the "Open In" menu after it completes loading
        //Dismiss the Loading icon
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] openURL:myFilePath];
            [SVProgressHUD dismiss];
        });
    });
    
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        self.title = self.detailItem.data.title;

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Enable orientation rotation and auto re-sizing of attributes
- (BOOL)shouldAutorotateToInterfaceOrientation {
    return YES;
}

@end
