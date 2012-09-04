//
//  StarViewController.m
//  Navigation
//
//  Created by  on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StarViewController.h"

@interface StarViewController ()

@end

@implementation StarViewController
@synthesize bar, team, info, img, star;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.bar.title = [self.star objectAtIndex:0];
    self.team.text = [self.star objectAtIndex:1];
    self.info.text = [self.star objectAtIndex:2];
    self.img.image = [UIImage imageNamed:[self.star objectAtIndex:3]];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
