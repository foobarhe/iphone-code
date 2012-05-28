//
//  TVTableViewController.h
//  NavigationNoSB
//
//  Created by Yahoo on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailsTVTableViewController;
@interface TVTableViewController : UITableViewController
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) IBOutlet DetailsTVTableViewController *detailsController;
@end
