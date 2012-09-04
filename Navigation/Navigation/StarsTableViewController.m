//
//  StarsTableViewController.m
//  Navigation
//
//  Created by  on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StarsTableViewController.h"

//import需要的头文件
#import "StarsTableViewCell.h"
#import "StarViewController.h"

@interface StarsTableViewController ()

@end

@implementation StarsTableViewController
@synthesize stars;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //初始化数据
    NSArray *p1 = [[NSArray alloc] initWithObjects:@"Kobe", @"kobe.jpg", @"湖人", @"后卫, 1.98", nil];
    NSArray *p2 = [[NSArray alloc] initWithObjects:@"James", @"james.jpg", @"热队", @"前锋, 2.03", nil];
    NSArray *p3 = [[NSArray alloc] initWithObjects:@"Wade", @"wade.jpg", @"热队", @"后卫, 1.93", nil];
    NSArray *p4 = [[NSArray alloc] initWithObjects:@"Howard", @"howard.jpg", @"魔术队", @"中锋, 2.11", nil];
    NSArray *p5 = [[NSArray alloc] initWithObjects:@"Durant", @"durant.jpg", @"雷霆队", @"前锋, 2.06", nil];
    NSArray *p6 = [[NSArray alloc] initWithObjects:@"Paul", @"paul.jpg", @"快船队", @"后卫, 1.83", nil];
    NSArray *p7 = [[NSArray alloc] initWithObjects:@"Griffin", @"griffin.jpg", @"快船队", @"前锋, 2.08", nil];
    self.stars = [[NSArray alloc] initWithObjects: p1, p2, p3, p4, p5, p6, p7, nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //在发生segue transition的时候，数据的传递。
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        StarViewController *detail = [segue destinationViewController];
        NSIndexPath *i = [self.tableView indexPathForSelectedRow];
        NSArray *the = [self.stars objectAtIndex:[i row]];
        detail.star = [[NSArray alloc] initWithObjects:[the objectAtIndex:0], [the objectAtIndex:2], [the objectAtIndex:3], [the objectAtIndex:1], nil];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.stars count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"starCell";
    StarsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.name.text = [[self.stars objectAtIndex:[indexPath row]] objectAtIndex:0];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
