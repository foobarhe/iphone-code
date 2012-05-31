//
//  GMViewController.h
//  GestureMotion
//
//  Created by Yahoo on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMViewController : UIViewController
{
    CGPoint startPoint;
}
@property (strong, nonatomic) IBOutlet UILabel *x;
@property (strong, nonatomic) IBOutlet UILabel *y;
@end
