//
//  AViewController.h
//  Archiving
//
//  Created by Yahoo on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phone;

@property (strong, nonatomic) NSString *dataFile;
-(IBAction)save:(id)sender;
@end
