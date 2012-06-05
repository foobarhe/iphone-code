//
//  VPViewController.h
//  VideoPlay
//
//  Created by  on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VPViewController : UIViewController
{
    MPMoviePlayerController *mediaPlayer;
}
-(IBAction)play:(id)sender;
@end
