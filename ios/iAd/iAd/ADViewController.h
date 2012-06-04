//
//  ADViewController.h
//  iAd
//
//  Created by Yahoo on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ADViewController : UIViewController <ADBannerViewDelegate>
{
    ADBannerView *bannerView;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
