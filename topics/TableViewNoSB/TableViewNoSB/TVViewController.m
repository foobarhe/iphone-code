//
//  TVViewController.m
//  TableViewNoSB
//
//  Created by  on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TVViewController.h"

@interface TVViewController ()

@end

@implementation TVViewController
@synthesize data;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //初始化data
    NSArray *p1 = [[NSArray alloc] initWithObjects:@"kobe.jpg", @"Kobe", @"Lakers", nil];
    NSArray *p2 = [[NSArray alloc] initWithObjects:@"james.jpg", @"James", @"热队", nil];
    NSArray *p3 = [[NSArray alloc] initWithObjects:@"howard.jpg", @"Howard", @"魔术队", nil];
    NSArray *p4 = [[NSArray alloc] initWithObjects:@"paul.jpg", @"Paul", @"快船队", nil];
    
    self.data = [[NSArray alloc] initWithObjects: p1, p2, p3, p4, nil];
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

//实现UITableViewDataSource protocol的2个方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建一个cell identifier
    static NSString *cellIdentifier = @"Cell";
    
    //try to reuse an existing cell that may have scrolled off the screen
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //if no previous cell available, create a new one using UITableViewCellStyleDefault
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSArray *the = [self.data objectAtIndex:[indexPath row]];
    
    //NSLog(@"%@, %@, %@", [the objectAtIndex:0], [the objectAtIndex:1], [the objectAtIndex:2]);    

    //动态地设置cell的内容
    cell.imageView.image = [UIImage imageNamed:[the objectAtIndex:0]];
    cell.textLabel.text = [the objectAtIndex:1];
    cell.detailTextLabel.text = [the objectAtIndex:2];
    
    return cell;
}

@end
