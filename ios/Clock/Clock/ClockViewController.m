//
//  ClockViewController.m
//  Clock
//
//  Created by Yahoo on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClockViewController.h"

//define private methods
@interface ClockViewController()
-(void) updateTimer;
@end

@implementation ClockViewController

@synthesize btnStartStop, lblClock;

-(IBAction) btnStartStopClicked: (id) sender
{
    if ([[btnStartStop titleForState:UIControlStateNormal] isEqualToString:@"Start Clock"]) 
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:(1) target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        [btnStartStop setTitle:@"Stop Clock" forState:UIControlStateNormal];
    }
    else
    {
        [timer invalidate];
        [btnStartStop setTitle:@"Start Clock" forState:UIControlStateNormal];
    }
}
-(void) updateTimer
{
    date = [NSDate date];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    lblClock.text = [formatter stringFromDate:date];
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
    
    formatter = [[NSDateFormatter alloc] init];
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
