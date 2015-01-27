//
//  DetailViewController.h
//  VSMessageStorage
//
//  Created by Usman Shafique on 1/27/15.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

