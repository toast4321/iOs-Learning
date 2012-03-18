//
//  MapPoint.m
//  Whereami
//
//  Created by Tosin Onafowokan on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subtitle:(NSString *)s{
    self = [super init];
    
    if (self){
        coordinate = c;
        [self setTitle:t];
        [self setSubtitle:s];
    }
    
    return self;
}

@end
