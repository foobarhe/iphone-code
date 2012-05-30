//
//  AViewController.m
//  Archiving
//
//  Created by Yahoo on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AViewController.h"

@implementation AViewController
@synthesize name, address, phone, dataFile;

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
    
    //获取该app的document dir
    NSFileManager *filemgr;
    NSArray *dirPaths;
    NSString *docsDir;
    
    filemgr = [NSFileManager defaultManager];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    //设置文件名
    dataFile = [[NSString alloc] initWithString:[docsDir stringByAppendingFormat:@"data.archive"]];
    
    //从文件中获取data，并unarchive到对象中
    if ([filemgr fileExistsAtPath:dataFile])
    {
        NSMutableArray *dataAry;
        dataAry = [NSKeyedUnarchiver unarchiveObjectWithFile:dataFile];
        
        name.text = [dataAry objectAtIndex:0];
        address.text = [dataAry objectAtIndex:1];
        phone.text = [dataAry objectAtIndex:2];
    }
    else
    {
        name.text = @"";
        address.text = @"";
        phone.text = @"";
    }
}
-(IBAction)save:(id)sender
{
    //隐藏键盘
    [name resignFirstResponder];
    [address resignFirstResponder];
    [phone resignFirstResponder];
    
    //获取数据并将其archive到文件中
    NSMutableArray *dataAry = [[NSMutableArray alloc] init];
    [dataAry addObject:name.text];
    [dataAry addObject:address.text];
    [dataAry addObject:phone.text];
    [NSKeyedArchiver archiveRootObject:dataAry toFile:dataFile];
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
