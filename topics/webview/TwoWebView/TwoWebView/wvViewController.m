//
//  wvViewController.m
//  TwoWebView
//
//  Created by Min He on 9/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "wvViewController.h"

@interface wvViewController ()

@end

@implementation wvViewController

@synthesize webviewLeft;
@synthesize webviewRight;
@synthesize back;
@synthesize forward;

- (IBAction)goBack:(id)sender
{
    [webviewRight goBack];
}

- (IBAction)goForward:(id)sender
{
    [webviewRight goForward];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //left webview
    [webviewLeft loadHTMLString:@"<html><head>"
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">"
                                "</head><body>"
                                "<ul>"
                                "<li><a href=\"http://3g.qq.com\">QQ</a></li>"
                                "<li><a href=\"http://www.yahoo.com\">Yahoo!</a></li>"
                                "<li><a href=\"http://www.sina.com.cn\">Sina</a></li>"
                                "</ul></body></html>" baseURL:[NSURL URLWithString:@""]];
    
    //right webview
    NSString *urlStr = @"http://3g.qq.com";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webviewRight loadRequest:request];
    
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


/* functions from UIWebViewDelegate */

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //only for webviewLeft
    if (navigationType == UIWebViewNavigationTypeLinkClicked) 
    {
        NSLog(@"link clicked, url=%@", request.URL);
        [webviewRight loadRequest:request];
    }
    return NO;
}

@end
