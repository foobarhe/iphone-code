//
//  NBATableViewController.m
//  TableView
//
//  Created by  on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NBATableViewController.h"

//包含进来table cell
#import "NBATableViewCell.h"

@interface NBATableViewController ()

@end

@implementation NBATableViewController
@synthesize data;   //data用于保存view controller的数据

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
    
    //初始化data的数据
    NSArray *p1 = [[NSArray alloc] initWithObjects:@"kobe.jpg", @"湖人", @"后卫, 1.98", nil];
    NSArray *p2 = [[NSArray alloc] initWithObjects:@"james.jpg", @"热队", @"前锋, 2.03", nil];
    NSArray *p3 = [[NSArray alloc] initWithObjects:@"wade.jpg", @"热队", @"后卫, 1.93", nil];
    NSArray *p4 = [[NSArray alloc] initWithObjects:@"howard.jpg", @"魔术队", @"中锋, 2.11", nil];
    NSArray *p5 = [[NSArray alloc] initWithObjects:@"durant.jpg", @"雷霆队", @"前锋, 2.06", nil];
    NSArray *p6 = [[NSArray alloc] initWithObjects:@"paul.jpg", @"快船队", @"后卫, 1.83", nil];
    NSArray *p7 = [[NSArray alloc] initWithObjects:@"griffin.jpg", @"快船队", @"前锋, 2.08", nil];
    self.data = [[NSArray alloc] initWithObjects: p1, p2, p3, p4, p5, p6, p7, nil];
    
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // 返回table view共包含多少个section
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // 返回每个section共包含多少个rows
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 该方法会在table view显示的时候自动被调用，它的输入为table view和要显示的行row的index；
    // 需要返回一个 UITableViewCell 的对象，共view controller显示
    
    //如下语句表示，使用nbaTableCell的prototype cell（模板）创建一个table cell
    static NSString *CellIdentifier = @"nbaTableCell";
    NBATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //设置这个table cell各个属性的值，它们已经在NBATableViewCell中绑定了UI的控件，因此可以更新控件的内容；
    cell.pTeam.text = [[self.data objectAtIndex:[indexPath row]] objectAtIndex:1];
    cell.pInfo.text = [[self.data objectAtIndex:[indexPath row]] objectAtIndex:2];
    UIImage *img = [UIImage imageNamed:[[self.data objectAtIndex:[indexPath row]] objectAtIndex:0]];
    cell.pImg.image = img;
    
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
