//
//  TMViewController.h
//  Time2Midnight
//
//  Created by Yahoo on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMViewController : UIViewController
{
    UILabel *countLbl;
}
@property (strong, nonatomic) IBOutlet UILabel *countLbl;
-(void)updateLbl;

@end
