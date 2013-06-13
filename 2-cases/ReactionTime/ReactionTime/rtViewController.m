//
//  rtViewController.m
//  ReactionTime
//
//  Created by Min He on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rtViewController.h"

@interface rtViewController ()

@end

@implementation rtViewController

bool greenLightOn = NO;
NSDate* start;

@synthesize light;


//called when an alert is dismissed from screen
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //change the image
    light.image = [UIImage imageNamed:@"yellowLightSmall.png"];
    greenLightOn = NO;
	
    //use timer to call a function after a time interval
	[NSTimer scheduledTimerWithTimeInterval:(3.0) target:self selector:@selector(changeToRed) userInfo:nil repeats:NO];
}

- (void)changeToRed
{
    //change the image
    light.image = [UIImage imageNamed:@"redLightSmall.png"];
    
    //set a random timer
    int delay = ((int) (random() % 7) + 1);
	[NSTimer scheduledTimerWithTimeInterval:(3.0 + delay) target:self selector:@selector(changeToGreen) userInfo:nil repeats:NO];
}

- (void)changeToGreen
{
    //change the image 
    light.image = [UIImage imageNamed:@"greenLightSmall.png"];
    greenLightOn = YES;
    
    start = [NSDate date];
}

- (IBAction)pressed:(id)sender
{
    if (greenLightOn == NO) 
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Reaction Time: Ready to Play" message:@"You hit too early." delegate:self cancelButtonTitle:@"Play" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    NSTimeInterval delay = fabs([start timeIntervalSinceNow]);
    NSString *score = [[NSString alloc] initWithFormat:@"Your score: %.2f s", delay];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Reaction Time: Ready to Play" message:score delegate:self cancelButtonTitle:@"Play" otherButtonTitles: nil];
    [alert show];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Reaction Time: Ready to Play" message:@"Hit the gas pedal as fast as you can after the light turns green."
												   delegate:self cancelButtonTitle:@"Play" otherButtonTitles: nil];
	[alert show];
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
