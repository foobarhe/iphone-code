//
//  ANViewController.m
//  Animation
//
//  Created by Yahoo on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANViewController.h"

@implementation ANViewController
@synthesize btn;

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    [UIButton beginAnimations:nil context:nil];
      [UIButton setAnimationDelegate:self];
      [UIButton setAnimationDuration:2];
      [UIButton setAnimationCurve:UIViewAnimationCurveEaseInOut];
      CGAffineTransform scaleTrans = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
      CGAffineTransform rotateTrans = CGAffineTransformMakeRotation(angle * M_PI / 180);
      btn.transform = CGAffineTransformConcat(scaleTrans, rotateTrans);
      btn.center = location;
      scaleFactor = (scaleFactor == 2 ? 1 : 2);
      angle = (angle == 180 ? 360 : 180);
    [UIButton commitAnimations];
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
    scaleFactor = 2;
    angle = 180;
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
