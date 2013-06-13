//
//  tViewController.h
//  Foo
//
//  Created by Min He on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tViewController : UIViewController
{
    int i;
    UILabel* count;
}

@property int i;
@property (strong, nonatomic) IBOutlet UILabel* count;

- (IBAction)add:(id)sender;
- (IBAction)sub:(id)sender;

@end
