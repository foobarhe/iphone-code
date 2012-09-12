//
//  FireViewController.m
//  Fire
//
//  Created by Yahoo on 9/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FireViewController.h"
#import "BackViewController.h"

@implementation FireViewController

@synthesize infoButton;
@synthesize navigationBar;
@synthesize fireImageView;
@synthesize backViewController;

- (IBAction)toggleView:(id)sender 
{
    if (backViewController == nil) {
        [self initBackViewController];
    }
    
    UIView *backView = backViewController.view;
    
    //the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:([backView superview] ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft) forView:self.view cache:YES];
    
    if ([backView superview] == nil) {
        //before showing back
        [backViewController viewWillAppear:YES];
        
        //update front
        [self.fireImageView removeFromSuperview];
        [self.infoButton removeFromSuperview];
        //update back
        [self.view addSubview:backView];
        [self.view insertSubview:navigationBar aboveSubview:backView];
        
        //show back
        [backViewController viewDidAppear:YES];
        
    } else {
        //before hiding back
        [backViewController viewWillDisappear:YES];
        
        //update back
        [backView removeFromSuperview];
        [navigationBar removeFromSuperview];
        //update front
        [self.view addSubview:self.fireImageView];
        [self.view insertSubview:infoButton aboveSubview:self.fireImageView];
        
        //hide back
        [backViewController viewDidDisappear:YES];
    }
    
    [UIView commitAnimations];
}

//动态地创建back view controller
- (void)initBackViewController 
{    
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
    
    //动态地创建一个UIImageView
    UIImageView* imageView = [[UIImageView alloc] initWithFrame: self.view.frame];
    //load all the frames of our animation
    imageView.animationImages = [NSArray arrayWithObjects:	
                                     [UIImage imageNamed:@"campFire01.gif"],
                                     [UIImage imageNamed:@"campFire02.gif"],
                                     [UIImage imageNamed:@"campFire03.gif"],
                                     [UIImage imageNamed:@"campFire04.gif"],
                                     [UIImage imageNamed:@"campFire05.gif"],
                                     [UIImage imageNamed:@"campFire06.gif"],
                                     [UIImage imageNamed:@"campFire07.gif"],
                                     [UIImage imageNamed:@"campFire08.gif"],
                                     [UIImage imageNamed:@"campFire09.gif"],
                                     [UIImage imageNamed:@"campFire10.gif"],
                                     [UIImage imageNamed:@"campFire11.gif"],
                                     [UIImage imageNamed:@"campFire12.gif"],
                                     [UIImage imageNamed:@"campFire13.gif"],
                                     [UIImage imageNamed:@"campFire14.gif"],
                                     [UIImage imageNamed:@"campFire15.gif"],
                                     [UIImage imageNamed:@"campFire16.gif"],
                                     [UIImage imageNamed:@"campFire17.gif"], nil];
    // all frames will execute in 1.75 seconds
    imageView.animationDuration = 1.75;
    // repeat the annimation forever
    imageView.animationRepeatCount = 0;
    // start animating
    [imageView startAnimating];
    
    self.fireImageView = imageView;
    // add the animation view to the main window
    [self.view insertSubview:self.fireImageView belowSubview:self.infoButton];
    
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
