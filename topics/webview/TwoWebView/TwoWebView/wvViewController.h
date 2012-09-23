//
//  wvViewController.h
//  TwoWebView
//
//  Created by Min He on 9/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wvViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView* webviewLeft;
    UIWebView* webviewRight;
    UIButton* back;
    UIButton* forward;
}

@property (strong, nonatomic) IBOutlet UIWebView* webviewLeft;
@property (strong, nonatomic) IBOutlet UIWebView* webviewRight;
@property (strong, nonatomic) UIButton* back;
@property (strong, nonatomic) UIButton* forward;

- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;

@end
