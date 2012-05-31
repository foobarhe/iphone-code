//
//  GMAppDelegate.h
//  GestureMotion
//
//  Created by Yahoo on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GMViewController;

@interface GMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) GMViewController *viewController;

@end
