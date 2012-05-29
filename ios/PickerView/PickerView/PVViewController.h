//
//  PVViewController.h
//  PickerView
//
//  Created by Yahoo on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PVViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *src;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UILabel *res;

@property (strong, nonatomic) NSArray *countries;
@property (strong, nonatomic) NSArray *exchangeRates;
-(IBAction)textFieldReturn:(id)sender;

@end
