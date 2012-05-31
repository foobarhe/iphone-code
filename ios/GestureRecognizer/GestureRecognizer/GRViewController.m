//
//  GRViewController.m
//  GestureRecognizer
//
//  Created by  on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end

@implementation GRViewController
@synthesize status;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //为当前view添加各种gestures
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(tapDetected:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(pinchDetected:)];
    [self.view addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(rotationDetected:)];
    [self.view addGestureRecognizer:rotation];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(swipeDetected:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
                                             
    UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(longpressDetacted:)];
    longpress.minimumPressDuration = 3;
    longpress.numberOfTouchesRequired = 1;  //需要几个finger
    [self.view addGestureRecognizer:longpress];
    
}
//各个gestures的callback
-(IBAction)tapDetected:(UIGestureRecognizer *)sender
{
    status.text = @"Double tap";
}
-(IBAction)pinchDetected:(UIGestureRecognizer *)sender
{
    CGFloat scale = [(UIPinchGestureRecognizer *)sender scale];
    CGFloat velocity = [(UIPinchGestureRecognizer *)sender velocity];
    NSString *str = [[NSString alloc] initWithFormat:@"Pinch: scale=%f, velocity=%f", scale, velocity];
    status.text = str;
}
-(IBAction)rotationDetected:(UIGestureRecognizer *)sender
{
    CGFloat radians = [(UIRotationGestureRecognizer *)sender rotation];
    CGFloat velocity = [(UIRotationGestureRecognizer *)sender velocity];
    NSString *str = [[NSString alloc] initWithFormat:@"Rotation: radians=%f, velocity=%f", radians, velocity];
    status.text = str;
}
-(IBAction)swipeDetected:(UIGestureRecognizer *)sender
{
    status.text = @"Swipe";
}
-(IBAction)longpressDetacted:(UIGestureRecognizer *)sender
{
    status.text = @"Longpress";
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
