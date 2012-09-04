//
//  ARViewController.h
//  AudioRecord
//
//  Created by Yahoo on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ARViewController : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer;
    AVAudioRecorder *audioRecorder;
}
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
-(IBAction)recordAudio:(id)sender;
-(IBAction)playAudio:(id)sender;
-(IBAction)stopAudio:(id)sender;
@end
