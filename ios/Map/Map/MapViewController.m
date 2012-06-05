//
//  MapViewController.m
//  Map
//
//  Created by Yahoo on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController
@synthesize mapView, toolbar;

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
    
    //设定map view使用user location
    mapView.showsUserLocation = YES;
    
    //动态地创建toolbar的button，和绑定callback
    UIBarButtonItem *zoom = [[UIBarButtonItem alloc] initWithTitle:@"Zoom" 
                                                             style:UIBarButtonItemStylePlain
                                                            target:self action:@selector(zoomIn:)];
    UIBarButtonItem *type = [[UIBarButtonItem alloc] initWithTitle:@"Type" 
                                                             style:UIBarButtonItemStylePlain 
                                                            target:self action:@selector(changeMapType:)];
    NSArray *buttons = [[NSArray alloc] initWithObjects:zoom, type, nil];
    toolbar.items = buttons;
}
-(void)zoomIn:(id)sender
{
    //获取user location
    MKUserLocation *userLocation = mapView.userLocation;
    //创建一个region (user location周围50m)
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 50, 50);
    //重新设置
    [mapView setRegion:region animated:NO];
}
-(void)changeMapType:(id)sender
{
    if (mapView.mapType == MKMapTypeStandard)
        mapView.mapType = MKMapTypeSatellite;
    else
        mapView.mapType = MKMapTypeStandard;
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
