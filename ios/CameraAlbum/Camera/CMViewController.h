//
//  CMViewController.h
//  Camera
//
//  Created by  on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CMViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    BOOL newMedia;  //保存是用户新拍了照片，还是从album中选择了一张图片
}
@property (strong, nonatomic) IBOutlet UIImageView *img;
- (IBAction)openCamera;
- (IBAction)openAlbum;
@end
