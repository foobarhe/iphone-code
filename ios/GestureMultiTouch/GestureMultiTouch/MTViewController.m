//
//  MTViewController.m
//  GestureMultiTouch
//
//  Created by Yahoo on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MTViewController.h"

@interface MTViewController()
-(void) updateUI:(NSSet *)touches withEvent:(UIEvent *)event fromMethod:(NSString *)method;
@end

@implementation MTViewController
@synthesize methodLbl, touchesLbl, tapsLbl;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self updateUI:touches withEvent:event fromMethod:@"touchesBegan"];
}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self updateUI:touches withEvent:event fromMethod:@"touchesMoved"];
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self updateUI:touches withEvent:event fromMethod:@"touchesEnded"];
}
-(void) updateUI:(NSSet *)touches withEvent:(UIEvent *)event fromMethod:(NSString *)method
{
    methodLbl.text = method;
    
    NSUInteger touchesCount = [touches count]; //即几个finger
    touchesLbl.text = [[NSString alloc] initWithFormat:@"%d fingers", touchesCount];
    NSUInteger tapsCount = [[touches anyObject] tapCount];
    tapsLbl.text = [[NSString alloc] initWithFormat:@"%d taps", tapsCount];
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
