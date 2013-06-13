//
//  FireViewController.m
//  Fire
//
//  Created by Yahoo on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FireViewController.h"
#import "FrontViewController.h"
#import "BackViewController.h"

@implementation FireViewController

@synthesize infoButton;
@synthesize frontViewController;
@synthesize navigationBar;
@synthesize backViewController;


- (IBAction)toggleView:(id)sender
{
    
    if (backViewController == nil) {
        [self initBackViewController];
    }
    
    UIView *frontView = frontViewController.view;
    UIView *backView = backViewController.view;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:([frontView superview] ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft) forView:self.view cache:YES];
    
    if ([frontView superview] != nil) {
        //before showing back
        [backViewController viewWillAppear:YES];
        //before hiding front
        [frontViewController viewWillDisappear:YES];
        
        //update front
        [frontView removeFromSuperview];
        [infoButton removeFromSuperview];
        //update back
        [self.view addSubview:backView];
        [self.view insertSubview:navigationBar aboveSubview:backView];

        //hide front
        [frontViewController viewDidDisappear:YES];
        //show back
        [backViewController viewDidAppear:YES];
        
    } else {
        //before showing front
        [frontViewController viewWillAppear:YES];
        //before hiding back
        [backViewController viewWillDisappear:YES];
        
        //update back
        [backView removeFromSuperview];
        [navigationBar removeFromSuperview];
        //update front
        [self.view addSubview:frontView];
        [self.view insertSubview:infoButton aboveSubview:frontViewController.view];
        
        //hide back
        [backViewController viewDidDisappear:YES];
        //show front
        [frontViewController viewDidAppear:YES];
    }
    
    [UIView commitAnimations];
    
}

//动态地创建back view controller
- (void)initBackViewController {
    
    self.backViewController = [[BackViewController alloc] initWithNibName:@"BackViewController" bundle:nil];
    
    //set up the navigation bar
    UINavigationBar *aNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
    aNavigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationBar = aNavigationBar;
    
    //decorate the navigation bar
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"Fire"];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toggleView:)];
    navigationItem.rightBarButtonItem = buttonItem;
    
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    
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
    
    //动态地创建front view controller并将其view添加到app的view中
    self.frontViewController = [[FrontViewController alloc] initWithNibName:@"FrontViewController" bundle:nil];
    //infoButton is already on FireViewController (static way)
    [self.view insertSubview: self.frontViewController.view belowSubview: infoButton];
    
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
