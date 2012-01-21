//
//  ScaryBugDoc.m
//  ScaryBugs
//
//  Created by Tosin Onafowokan on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScaryBugDoc.h"
#import "ScaryBugData.h"

@implementation ScaryBugDoc

@synthesize data = _data;
@synthesize thumbImage = _thumbImage;
@synthesize fullImage = _fullImage;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage{
    if ((self = [super init])){
        _data = [[ScaryBugData alloc] initWithTitle:title rating:rating];
        _thumbImage = thumbImage;
        _fullImage = fullImage;
    }
    return self;
}

@end
