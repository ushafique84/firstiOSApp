//
//  DetailViewController.h
//  VSMessageStorage
//
//  Created by Usman Shafique on 1/27/15.
//
//

#import <UIKit/UIKit.h>

@class MessagesDoc;

@interface DetailViewController : UIViewController <UIDocumentInteractionControllerDelegate>;

@property (strong, nonatomic) MessagesDoc *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property UIDocumentInteractionController *documentInteractionController;

@property (strong) NSMutableArray *messages;

- (IBAction)openZDM:(id)sender;

@end

