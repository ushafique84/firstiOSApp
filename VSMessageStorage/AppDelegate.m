//
//  AppDelegate.m
//  VSMessageStorage
//
//  Created by Usman Shafique on 1/27/15.
//
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "MasterViewController.h"
#import "MessagesDoc.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate

    //OVERRIDING METHOD
    //ADDING SAMPLE MESSAGES AND ADDING TO A MUTABLE ARRAY FOR DETAILED VIEW
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MessagesDoc *message1 = [[MessagesDoc alloc] initWithTitle:@"Single Recipient" bundleName:@"single_recipient"];
    MessagesDoc *message2 = [[MessagesDoc alloc] initWithTitle:@"Multiple Recipeint" bundleName:@"multiple_recipient"];
    MessagesDoc *message3 = [[MessagesDoc alloc] initWithTitle:@"Multiple w/ Attachment" bundleName:@"multi_recip_attach"];
    
    NSMutableArray *messages = [NSMutableArray arrayWithObjects:message1, message2, message3, nil];
    
    UISplitViewController *splitViewController = (UISplitViewController *) self.window.rootViewController;
    UINavigationController *navController = [splitViewController.viewControllers objectAtIndex:0];
    MasterViewController *masterController = [navController.viewControllers objectAtIndex:0];
    masterController.messages = messages;
    

    
    // Override point for customization after application launch.
    //UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    //UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    //navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    //splitViewController.delegate = self;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

@end
