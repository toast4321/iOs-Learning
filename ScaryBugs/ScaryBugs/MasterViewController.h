//
//  MasterViewController.h
//  ScaryBugs
//
//  Created by Tosin Onafowokan on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class DetailViewController;
@class EditBugViewController;

@interface MasterViewController : UITableViewController{
    NSMutableArray *_bugs;
    EditBugViewController *_editBugViewController;
}

@property (retain) EditBugViewController *editBugViewController;
@property (retain) NSMutableArray *bugs;
//@property (strong, nonatomic) DetailViewController *detailViewController;

@end
