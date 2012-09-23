//
//  wvViewController.h
//  WebViewTest
//
//  Created by Min He on 9/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wvViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView* webview;
    UIButton* back;
    UIButton* forward;
    UIActivityIndicatorView* activityIndicator;
}

@property (strong, nonatomic) IBOutlet UIWebView* webview;
@property (strong, nonatomic) IBOutlet UIButton* back;
@property (strong, nonatomic) IBOutlet UIButton* forward;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicator;

- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;
   
@end
