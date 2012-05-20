//
//  HideKeyboardViewController.h
//  HideKeyboard
//
//  Created by Yahoo on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HideKeyboardViewController : UIViewController
{
    UITextField *txt;
}
@property (strong, nonatomic) IBOutlet UITextField *txt;

- (IBAction)btnOnClick:(id) sender;
- (IBAction)keyOnReturn:(id)sender;
-(IBAction)bgdOnTouch:(id) sender;

@end
