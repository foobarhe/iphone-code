//
//  fViewController.m
//  foo
//
//  Created by Min He on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "fViewController.h"

@interface fViewController ()

@end

@implementation fViewController

@synthesize name;
@synthesize phone;
@synthesize avatar;

- (IBAction)chooseImage:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:picker animated:YES];
}

- (IBAction)save:(id)sender
{
    // Hide the keyboard
    [name resignFirstResponder];
    [phone resignFirstResponder];
    
    //create strings for the text
    NSString* nameStr = name.text;
    NSString* phoneStr = phone.text;
    
    //create NSData for image
    UIImage* image = avatar.image;
    NSData* imageData = UIImagePNGRepresentation(image);
    
    //save the data into default system
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nameStr forKey:@"name"];
    [defaults setObject:phoneStr forKey:@"phone"];
    [defaults setObject:imageData forKey:@"image"];
    [defaults synchronize];
    NSLog(@"Data saved");
    
}

- (IBAction)hideKeyboard:(id)sender
{
    [sender resignFirstResponder];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    avatar.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //get the saved data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString* nameStr = [defaults objectForKey:@"name"];
    NSString* phoneStr = [defaults objectForKey:@"phone"];
    NSData* imageData = [defaults dataForKey:@"image"];
    
    //set the view
    UIImage* image = [UIImage imageWithData:imageData];
    avatar.image = image;
    name.text = nameStr;
    phone.text = phoneStr;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
