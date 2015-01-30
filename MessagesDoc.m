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
@synthesize bundleName = _bundleName;


- (id)initWithTitle:(NSString*)title bundleName:(NSString *)bundleName{
    if ((self = [super init]))
    {
        self.data = [[MessagesData alloc] initWithTitle:title];
        self.bundleName = bundleName;
    }
    return self;
}

@end
