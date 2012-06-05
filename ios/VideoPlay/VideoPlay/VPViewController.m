//
//  VPViewController.m
//  VideoPlay
//
//  Created by  on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VPViewController.h"

@interface VPViewController ()

@end

@implementation VPViewController

-(IBAction)play:(id)sender
{
    //from local
    //NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"MOVIE" ofType:@"MOV"]];
    //from internet
    NSURL *url = [NSURL URLWithString:@"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"];
    
    //创建player并设置
    mediaPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:mediaPlayer];
    mediaPlayer.controlStyle = MPMovieControlStyleDefault;
    mediaPlayer.shouldAutoplay = YES;

    //将其添加到当前的view中
    [self.view addSubview:mediaPlayer.view];
    [mediaPlayer setFullscreen:YES animated:YES];
}
//callback
-(void) moviePlayBackDidFinish:(NSNotification *)notification
{
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    
    if ([player respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

@end
