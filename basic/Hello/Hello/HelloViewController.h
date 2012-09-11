//
//  HelloViewController.h
//  Hello
//
//  Created by Yahoo on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloViewController : UIViewController
{
    UITextField *txt;
}

@property (strong, nonatomic) IBOutlet UITextField *txt;
-(IBAction) btnClicked: (id) sender;

@end
