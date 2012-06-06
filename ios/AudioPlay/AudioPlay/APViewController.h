//
//  APViewController.h
//  AudioPlay
//
//  Created by Yahoo on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface APViewController : UIViewController <AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer;
}
@property (strong, nonatomic) IBOutlet UISlider *volumeControl;
-(IBAction)play:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)adjustVolume:(id)sender;
@end
