//
//  StarViewController.h
//  Navigation
//
//  Created by  on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarViewController : UIViewController
@property (strong, nonatomic) IBOutlet UINavigationItem *bar;
@property (strong, nonatomic) IBOutlet UILabel *team;
@property (strong, nonatomic) IBOutlet UILabel *info;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) NSArray *star;
@end
