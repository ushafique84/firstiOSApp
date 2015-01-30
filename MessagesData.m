//
//  MessagesData.m
//  VSMessageStorage
//
//  Created by Usman Shafique on 1/27/15.
//
//

#import "MessagesData.h"

@implementation MessagesData

@synthesize title = _title;

- (id)initWithTitle:(NSString *)title
{
    if ((self = [super init]))
    {
        self.title = title;
    }
    return self;
}

@end
