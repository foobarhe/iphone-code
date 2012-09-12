//
//  GMViewController.m
//  GestureMotion
//
//  Created by Yahoo on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GMViewController.h"

@implementation GMViewController
@synthesize x, y;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取起点坐标
    UITouch *theTouch = [touches anyObject];
    startPoint = [theTouch locationInView:self.view];
    
    CGFloat xValue = startPoint.x;
    CGFloat yValue = startPoint.y;
    x.text = [NSString stringWithFormat:@"x = %f", xValue];
    y.text = [NSString stringWithFormat:@"y = %f", yValue];
    
}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //显示move的坐标
    UITouch *theTouch = [touches anyObject];
    CGPoint location = [theTouch locationInView:self.view];
    
    CGFloat xValue = location.x;
    CGFloat yValue = location.y;
    x.text = [NSString stringWithFormat:@"x = %f", xValue];
    y.text = [NSString stringWithFormat:@"y = %f", yValue];

}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *theTouch = [touches anyObject];
    CGPoint endPoint = [theTouch locationInView:self.view];
    
    x.text = [NSString stringWithFormat:@"start = %f, %f", startPoint.x, startPoint.y];
    y.text = [NSString stringWithFormat:@"start = %f, %f", endPoint.x, endPoint.y];
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
