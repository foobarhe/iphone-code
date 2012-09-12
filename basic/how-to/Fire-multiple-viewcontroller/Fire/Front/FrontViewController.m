//
//  FrontViewController.m
//  Fire
//
//  Created by Yahoo on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FrontViewController.h"

@implementation FrontViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //动态地创建一个UIImageView
    
    UIImageView* fireImageView = [[UIImageView alloc] initWithFrame: self.view.frame];
    //load all the frames of our animation
    fireImageView.animationImages = [NSArray arrayWithObjects:	
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
    fireImageView.animationDuration = 1.75;
    // repeat the annimation forever
    fireImageView.animationRepeatCount = 0;
    // start animating
    [fireImageView startAnimating];
    // add the animation view to the main window 
    [self.view addSubview:fireImageView];
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
