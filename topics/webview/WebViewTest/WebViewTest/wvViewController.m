//
//  wvViewController.m
//  WebViewTest
//
//  Created by Min He on 9/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "wvViewController.h"

@interface wvViewController ()

@end

@implementation wvViewController

@synthesize webview;
@synthesize back;
@synthesize forward;
@synthesize activityIndicator;

- (IBAction)goBack:(id)sender
{
    [webview goBack];
}

- (IBAction)goForward:(id)sender
{
    [webview goForward];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //dynamically create a activity indicator
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.hidesWhenStopped = YES;
    self.activityIndicator.center = CGPointMake(160, 160);
    
    [self.view addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    
	//load the webpage
    NSString *urlAddress = @"http://www.sina.com.cn";
	NSURL *url = [NSURL URLWithString:urlAddress];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	[self.webview loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//functions from UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //called before webview starts to load requests
    if (navigationType == UIWebViewNavigationTypeLinkClicked) 
    {
        NSLog(@"clicked URL: %@", request.URL);
    }
    NSLog(@"webview is going to load the page");
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)thisWebView
{
	back.enabled = NO;
	forward.enabled = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)thisWebView
{    
	[self.activityIndicator stopAnimating];
    
 	if(thisWebView.canGoBack == YES)
	{
		back.enabled = YES;
		back.highlighted = YES;
	}
	if(thisWebView.canGoForward == YES)
	{
		forward.enabled = YES;
		forward.highlighted = YES;
	}
    
    //execute some javascript
    NSString *title = [webview stringByEvaluatingJavaScriptFromString:@"document.title"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"The site title is"
                                   message: title
                                  delegate: self
                         cancelButtonTitle: @"Close"
                         otherButtonTitles: nil];
    [alert show];

}

@end
