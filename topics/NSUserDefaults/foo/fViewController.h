//
//  fViewController.h
//  foo
//
//  Created by Min He on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UITextField* name;
    UITextField* phone;
    UIImageView* avatar;
}

@property (strong, nonatomic) IBOutlet UITextField* name;
@property (strong, nonatomic) IBOutlet UITextField* phone;
@property (strong, nonatomic) IBOutlet UIImageView* avatar;

- (IBAction)chooseImage:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end
