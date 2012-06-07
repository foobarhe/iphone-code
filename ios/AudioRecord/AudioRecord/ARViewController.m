//
//  ARViewController.m
//  AudioRecord
//
//  Created by Yahoo on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ARViewController.h"

@implementation ARViewController
@synthesize playButton, recordButton, stopButton;

-(IBAction)recordAudio:(id)sender
{
    if (!audioRecorder.recording)
    {
        playButton.enabled = NO;
        stopButton.enabled = YES;
        [audioRecorder record];
    }
}
-(IBAction)playAudio:(id)sender
{
    if (!audioRecorder.recording)
    {
        stopButton.enabled = YES;
        recordButton.enabled = NO;

        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioRecorder.url error:&error];
        audioPlayer.delegate = self;
        
        if (error)
        {
            NSLog(@"Error: %@", [error localizedDescription]);
        }
        else
        {
            [audioPlayer play];
        }           
    }
}
-(IBAction)stopAudio:(id)sender
{
    stopButton.enabled = NO;
    playButton.enabled = YES;
    recordButton.enabled = YES;
    if (audioRecorder.recording)
    {
        [audioRecorder stop];
    }
    else if (audioPlayer.playing)
    {
        [audioPlayer stop];
    }
}

//实现delegate的接口的方法
-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
    recordButton.enabled = YES;
    stopButton.enabled = NO;
}
-(void)audioPlayerDecodeErrorDidOccur:
(AVAudioPlayer *)player 
                                error:(NSError *)error
{
    NSLog(@"Decode Error occurred");
}
-(void)audioRecorderDidFinishRecording:
(AVAudioRecorder *)recorder 
                          successfully:(BOOL)flag
{
}
-(void)audioRecorderEncodeErrorDidOccur:
(AVAudioRecorder *)recorder 
                                  error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}




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
    
    playButton.enabled = NO;
    stopButton.enabled = NO;
    
    //获取该app的document路径
    NSArray *dirPaths;
    NSString *docsDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:@"sound.caf"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    //设置record settings
    NSDictionary *recordSettings = [NSDictionary
                                    dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey, [NSNumber numberWithInt:16],
                                    AVEncoderBitRateKey, [NSNumber numberWithInt:2],
                                    AVNumberOfChannelsKey, [NSNumber numberWithFloat:44100.0],
                                    AVSampleRateKey, nil];
    NSError *error = nil;
    audioRecorder = [[AVAudioRecorder alloc] initWithURL:soundFileURL settings:recordSettings error:&error];
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    }
    else
    {
        [audioRecorder prepareToRecord];
    }
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
