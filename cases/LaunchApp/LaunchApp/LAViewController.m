//
//  LAViewController.m
//  LaunchApp
//
//  Created by Yahoo on 9/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LAViewController.h"

@implementation LAViewController


- (IBAction)phoneUrlClicked:(id)sender
{
    NSLog(@"phone url clicked");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://13800138000"]];
}
- (IBAction)smsUrlClicked:(id)sender
{
    NSLog(@"sms url clicked");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://13800138000"]];
}
- (IBAction)emailUrlClicked:(id)sender
{    
    NSLog(@"email url clicked");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://steve@apple.com"]];
}
- (IBAction)mapUrlClicked:(id)sender
{
    NSLog(@"map url clicked");
    
    NSString* address = @"1 Infinite Loop, Cupertino, CA 95014";
	// URL encode the spaces
    address = [address stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
	
    NSString* urlText = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", address];
	NSLog(@"urlText for map: %@", urlText);
    
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlText]];
}
- (IBAction)browserUrlClicked:(id)sender
{
    NSLog(@"browser url clicked");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.apple.com"]];
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
