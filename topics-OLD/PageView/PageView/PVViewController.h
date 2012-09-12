//
//  PVViewController.h
//  PageView
//
//  Created by  on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContentViewController.h"

@interface PVViewController : UIViewController <UIPageViewControllerDataSource>

//控制各个page之间的跳转
@property (strong, nonatomic) UIPageViewController *pageviewController;
//保存所有page的data
@property (strong, nonatomic) NSArray *pageDataAry;

@end
