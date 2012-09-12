//
//  FireViewController.h
//  Fire
//
//  Created by Yahoo on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FrontViewController;
@class BackViewController;

@interface FireViewController : UIViewController 
{
    UIButton *infoButton;
    FrontViewController *frontViewController;
    
    UINavigationBar *navigationBar;
    BackViewController *backViewController;
}

@property (nonatomic, retain) IBOutlet UIButton *infoButton;
@property (nonatomic, retain) FrontViewController *frontViewController;
@property (nonatomic, retain) UINavigationBar *navigationBar;
@property (nonatomic, retain) BackViewController *backViewController;

- (IBAction)toggleView:(id)sender;
- (void)initBackViewController;

@end
