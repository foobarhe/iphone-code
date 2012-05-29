//
//  PVViewController.m
//  PickerView
//
//  Created by Yahoo on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVViewController.h"

@implementation PVViewController
@synthesize src, picker, res;
@synthesize countries, exchangeRates;

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
    
    //初始化data
    self.countries = [[NSArray alloc] initWithObjects: @"Australia (AUD)", @"China (CNY)", @"France (EUR)", @"Great Britain (GBP)", @"Japan (JPY)", nil];
    self.exchangeRates = [[NSArray alloc] 
                          initWithObjects: [NSNumber numberWithFloat:0.9922],
                          [NSNumber numberWithFloat:6.5938], 
                          [NSNumber numberWithFloat:0.7270],
                          [NSNumber numberWithFloat:0.6206], 
                          [NSNumber numberWithFloat:81.57], nil];
}

//hide keyboard的callback
-(IBAction)textFieldReturn:(id)sender
{
    [self resignFirstResponder];
}

//实现data source protocol的接口
- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [countries count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [countries objectAtIndex:row];
} 

//实现delegate protocol的方法
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    float rate = [[exchangeRates objectAtIndex:row] floatValue];
    float dollars = [src.text floatValue];
    float result = dollars * rate;
    
    NSString *str = [[NSString alloc] initWithFormat: @"%.2f USD = %.2f %@", dollars, result, [countries objectAtIndex:row]];
    res.text = str;
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
