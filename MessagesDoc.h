    //
//  MessagesDoc.h
//  VSMessageStorage
//
//  Created by Usman Shafique on 1/27/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MessagesData;

@interface MessagesDoc : NSObject

@property (strong) MessagesData *data;
@property (strong) NSString *fileName;

- (id)initWithTitle:(NSString*)title fileName:(NSString*)fileName;

@end
