//
//  LBSViewController.h
//  Location
//
//  Created by Yahoo on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LBSViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationMgr;
    CLLocation *startLocation;
}
@property (strong, nonatomic) IBOutlet UILabel *lati;
@property (strong, nonatomic) IBOutlet UILabel *longi;
@property (strong, nonatomic) IBOutlet UILabel *alti;
@property (strong, nonatomic) IBOutlet UILabel *hori;
@property (strong, nonatomic) IBOutlet UILabel *verti;
@property (strong, nonatomic) IBOutlet UILabel *distance;
@end
