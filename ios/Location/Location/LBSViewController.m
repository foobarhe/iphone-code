//
//  LBSViewController.m
//  Location
//
//  Created by Yahoo on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LBSViewController.h"

@implementation LBSViewController
@synthesize lati, longi, alti, hori, verti, distance;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


//实现CLLocationManagerDelegate的2个方法
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //从newLocation中获取最新信息
    NSString *currentLati = [[NSString alloc] initWithFormat:@"%g", newLocation.coordinate.latitude];
    lati.text = currentLati;
    
    NSString *currentLong = [[NSString alloc] initWithFormat:@"%g", newLocation.coordinate.longitude];
    longi.text = currentLong;
    
    NSString *currentAlti = [[NSString alloc] initWithFormat:@"%g", newLocation.altitude];
    alti.text = currentAlti;
    
    NSString *horiAccu = [[NSString alloc] initWithFormat:@"%g", newLocation.horizontalAccuracy];
    hori.text = horiAccu;
    
    NSString *vertiAccu = [[NSString alloc] initWithFormat:@"%g", newLocation.verticalAccuracy];
    verti.text = vertiAccu;
    
    if (!startLocation)
    {
        startLocation = newLocation;
    }
    CLLocationDistance dist = [newLocation distanceFromLocation:oldLocation];
    NSString *dis = [[NSString alloc] initWithFormat:@"%f", dist];
    distance.text = dis;
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //创建location manager
    locationMgr = [[CLLocationManager alloc] init];
    locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    locationMgr.delegate = self;
    [locationMgr startUpdatingLocation];
    
    startLocation = nil;
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
