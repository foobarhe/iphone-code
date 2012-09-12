//
//  PVViewController.m
//  PageView
//
//  Created by  on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVViewController.h"

@interface PVViewController ()

@end

@implementation PVViewController
@synthesize pageviewController, pageDataAry;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //初始化所有page的data
    NSMutableArray *rawData = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++)
    {
        NSString *str = [[NSString alloc] initWithFormat:@"<html><head></head><body><h1>Chapter %d</h1><p>This is the page %d of content displayed using UIPageViewController</p></body></html>", i, i];
        [rawData addObject:str];
    }
    self.pageDataAry = [[NSArray alloc] initWithArray:rawData];
    
    //创建 UIPageViewController
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey: UIPageViewControllerOptionSpineLocationKey];
    self.pageviewController = [[UIPageViewController alloc] 
                               initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    pageviewController.dataSource = self;
    [[self.pageviewController view] setFrame:[[self view] bounds]];
    
    ContentViewController *initViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initViewController];
    [self.pageviewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    //把page view controller添加到当前的view中
    [self addChildViewController:pageviewController];
    [[self view] addSubview:[pageviewController view]];
    [pageviewController didMoveToParentViewController:self];
}

//实现 UIPageViewControllerDataSource 的2个方法，前后翻页
-(UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController: (ContentViewController *)viewController];
    if (index == 0 || index == NSNotFound)
    {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}
-(UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController: (ContentViewController *)viewController];
    if (index == NSNotFound)
    {
        return nil;
    }
    
    index++;
    if (index == [self.pageDataAry count])
    {
        return nil;
    }
    return [self viewControllerAtIndex:index];    
}

//辅助的方法
-(ContentViewController *) viewControllerAtIndex:(NSUInteger)index
{
    if ( ([self.pageDataAry count] == 0) || (index >= [self.pageDataAry count]) ) {
        return nil;
    }
    
    ContentViewController *cvc = [[ContentViewController alloc] initWithNibName:@"ContentViewController" bundle:nil];
    cvc.webviewData = [self.pageDataAry objectAtIndex:index];
    return cvc;
}
-(NSUInteger) indexOfViewController:(ContentViewController *)viewController
{
    return [self.pageDataAry indexOfObject:viewController.webviewData];
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
