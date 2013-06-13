//
//  tViewController.m
//  Foo
//
//  Created by Min He on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "tViewController.h"

@interface tViewController ()

@end

@implementation tViewController

@synthesize i;
@synthesize count;

- (IBAction)add:(id)sender
{
    i++;
    if (i > 9999) 
    {
        i = 9999;
    }
    NSString* iTxt = [[NSString alloc] initWithFormat:@"%d", i];
    count.text = iTxt;
}

- (IBAction)sub:(id)sender
{
    i--;
    if (i <= 0) 
    {
        i = 0;
    }
    NSString* iTxt = [[NSString alloc] initWithFormat:@"%d", i];
    count.text = iTxt;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    i = 0;
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
