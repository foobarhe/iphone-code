//
//  CMViewController.m
//  Camera
//
//  Created by  on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMViewController.h"

@interface CMViewController ()

@end

@implementation CMViewController
@synthesize img;

-(void)openCamera
{
    //判断是否支持camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        //创建UIImagePickerController对象
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        //对其进行config
        imgPicker.delegate = self;
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imgPicker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, (NSString *)kUTTypeVideo, nil];
        imgPicker.allowsEditing = NO;
        
        [self presentModalViewController:imgPicker animated:YES];
        newMedia = YES;
    }
    else 
    {
        UIAlertView *alert;
        alert = [[UIAlertView alloc] initWithTitle:@"No Camera" message:@"Not support camera" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(void)openAlbum
{
    //判断是否支持album
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        //创建UIImagePickerController对象
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        //对其进行config
        imgPicker.delegate = self;
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imgPicker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, (NSString *)kUTTypeVideo, nil];
        imgPicker.allowsEditing = NO;
        
        [self presentModalViewController:imgPicker animated:YES];
        newMedia = NO;
    }
    else 
    {
        UIAlertView *alert;
        alert = [[UIAlertView alloc] initWithTitle:@"No Album" message:@"Not support album" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
        [alert show];
    }
}
//实现protocol的几个方法
//当用户拍完照片之后，会调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissModalViewControllerAnimated:YES];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        img.image = image;
        if (newMedia)
        {
            //新拍的保存
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:finishedSavingWithError:contextInfo:), nil);
        }
        else
        {
        
        }
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
}
//保存完之后的callback
-(void) image:(UIImage *)image finishedSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save failed" message:@"Failed to save image" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
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
