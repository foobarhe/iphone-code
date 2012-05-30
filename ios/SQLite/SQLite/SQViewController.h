//
//  SQViewController.h
//  SQLite
//
//  Created by  on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface SQViewController : UIViewController
{
    NSString *dbfile;
    sqlite3 *db;
}
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UILabel *result;

-(IBAction)save:(id)sender;
-(IBAction)search:(id)sender;

@end
