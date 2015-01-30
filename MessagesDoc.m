//
//  MessagesDoc.m
//  VSMessageStorage
//
//  Created by Usman Shafique on 1/27/15.
//
//

#import "MessagesDoc.h"
#import "MessagesData.h"

@implementation MessagesDoc
@synthesize data = _data;
@synthesize fileName = _fileName;


- (id)initWithTitle:(NSString*)title fileName:(NSString *)fileName{
    if ((self = [super init]))
    {
        self.data = [[MessagesData alloc] initWithTitle:title];
        self.fileName = fileName;
    }
    return self;
}

@end
