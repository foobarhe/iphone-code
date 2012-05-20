//
//  ClockViewController.h
//  Clock
//
//  Created by Yahoo on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockViewController : UIViewController
{
    UIButton *btnStartStop;
    UILabel *lblClock;
    
    NSTimer *timer;
    NSDate *date;
    NSDateFormatter *formatter;
}

@property (strong, nonatomic) IBOutlet UIButton *btnStartStop;
@property (strong, nonatomic) IBOutlet UILabel *lblClock;
-(IBAction) btnStartStopClicked: (id) sender;

@end
