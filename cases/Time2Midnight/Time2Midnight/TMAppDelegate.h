//
//  TMAppDelegate.h
//  Time2Midnight
//
//  Created by Yahoo on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMViewController;

@interface TMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TMViewController *viewController;

//timer for application
@property (strong, nonatomic) NSTimer *timer;
-(void) onTimer;

@end
