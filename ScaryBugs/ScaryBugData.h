//
//  ScaryBugData.h
//  ScaryBugs
//
//  Created by Tosin Onafowokan on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject{
    NSString *_title;
    float _rating;
}

@property (copy) NSString *title;
@property float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;
@end
