//
//  rtViewController.h
//  ReactionTime
//
//  Created by Min He on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rtViewController : UIViewController
{
    UIImageView* light;
}

@property (strong, nonatomic) IBOutlet UIImageView* light;

- (IBAction)pressed:(id)sender;

@end
