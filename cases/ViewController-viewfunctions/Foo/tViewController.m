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

- (void)awakeFromNib
{
    NSLog(@"before super awakeFromNib");
    [super awakeFromNib];
    NSLog(@"after super awakeFromNib"); 
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear");    
}

- (void)viewDidLoad
{
    NSLog(@"before super viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"after super viewDidLoad"); 
}

- (void)viewDidUnload
{
    NSLog(@"before super viewDidUnload");
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    NSLog(@"after super viewDidUnload");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
