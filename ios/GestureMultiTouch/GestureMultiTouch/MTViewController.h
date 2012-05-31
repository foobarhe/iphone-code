//
//  MTViewController.h
//  GestureMultiTouch
//
//  Created by Yahoo on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *methodLbl;
@property (strong, nonatomic) IBOutlet UILabel *touchesLbl;
@property (strong, nonatomic) IBOutlet UILabel *tapsLbl;
@end
