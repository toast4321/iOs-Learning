//
//  ScaryBugData.m
//  ScaryBugs
//
//  Created by Tosin Onafowokan on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

@synthesize title = _title;
@synthesize rating = _rating;

- (id)initWithTitle:(NSString *)title rating:(float)rating{
    
    if ((self = [super init])){
        _title = [title copy];
        _rating = rating;
    }
    
    return self;
}

@end
