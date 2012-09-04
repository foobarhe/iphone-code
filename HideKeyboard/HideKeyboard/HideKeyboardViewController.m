//
//  HideKeyboardViewController.m
//  HideKeyboard
//
//  Created by Yahoo on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HideKeyboardViewController.h"

//define private methods using anonymous category
@interface HideKeyboardViewController()
-(void) showAlert;
@end

@implementation HideKeyboardViewController

@synthesize txt;

- (IBAction) btnOnClick:(id) sender
{
    [self showAlert];
}
- (IBAction)keyOnReturn:(id)sender
{
    [sender resignFirstResponder]; 
    /*
     hide the keyboard:
     the keyboard was shown(as its first responder) when the UITextField was touched. 
     here the sender is txt, call its method [sender resignFirstResponder] to hide keyboard.
     */
    [self showAlert];
}
-(IBAction)bgdOnTouch:(id) sender
{
    //call txt's resignFirstResponder to hide keyboard
    [txt resignFirstResponder];
}
-(void) showAlert
{
    NSString *str = [[NSString alloc] initWithFormat:@"Hello, %@", txt.text];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello!" message:str delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
