//
//  FireViewController.h
//  Fire
//
//  Created by Yahoo on 9/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BackViewController;

@interface FireViewController : UIViewController
{
    UIButton *infoButton;
    UIImageView* fireImageView;
    UINavigationBar *navigationBar;
    BackViewController *backViewController;
}

@property (strong, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) UIImageView *fireImageView;
@property (strong, nonatomic) UINavigationBar *navigationBar;
@property (strong, nonatomic) BackViewController *backViewController;

- (IBAction)toggleView:(id)sender;
- (void)initBackViewController;

@end
