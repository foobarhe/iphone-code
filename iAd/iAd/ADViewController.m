//
//  ADViewController.m
//  iAd
//
//  Created by Yahoo on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ADViewController.h"

@implementation ADViewController
@synthesize tableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //创建ad banner view (设置其支持portrait和landscape的orientations)
    bannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    bannerView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait, ADBannerContentSizeIdentifierLandscape, nil];
    bannerView.delegate = self;
    
}

//如下的几个以banner开头的方法是实现 ADBannerViewDelegate protocol需要实现的方法
//如上配置之后并不会显示ads，需要实现如下方法，在ad从apple ads inventory中下载下来之后，运行该方法
-(void) bannerViewDidLoadAd:(ADBannerView *)banner
{
    tableView.tableHeaderView = bannerView;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

//改写如下方法，使得device rotation的时候，iAd也可以rotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation))
    {
        bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    }
    else
    {
        bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    }
    return YES;
}

@end
