//
//  DPViewController.h
//  DatePicker
//
//  Created by Yahoo on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UILabel *lbl;
-(IBAction)getSelection:(id)sender;
@end
