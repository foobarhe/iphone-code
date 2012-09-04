//
//  CDViewController.m
//  CoreData
//
//  Created by Yahoo on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CDViewController.h"
#import "CDAppDelegate.h"

@interface CDViewController ()
//定义一个私有方法
-(void) hideKeyboard;
@end

@implementation CDViewController
@synthesize name, address, phone, status;

-(IBAction)save:(id)sender
{
    [self hideKeyboard];
    //判断界面的内容
    if ([name.text isEqualToString:@""])
    {
        name.placeholder = @"Name can not be empty.";
        return;
    }
    if ([address.text isEqualToString:@""])
    {
        address.placeholder = @"Address can not be empty.";
        return;
    }
    if ([phone.text isEqualToString:@""])
    {
        phone.placeholder = @"Phone can not be empty.";
        return;
    }
    
    //创建 managed object context
    CDAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    //创建 managed object
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Contacts" 
                  inManagedObjectContext:context];

    //set data
    [newContact setValue:name.text forKey:@"name"];
    [newContact setValue:address.text forKey:@"address"];
    [newContact setValue:phone.text forKey:@"phone"];
    
    //保存
    NSError *error;
    [context save:&error];
    
    //更新UI
    name.text = @"";
    address.text = @"";
    phone.text = @"";
    status.text = @"Contact Added";
    
}
-(IBAction)search:(id)sender
{
    [self hideKeyboard];
    //判断界面的内容
    if ([name.text isEqualToString:@""])
    {
        name.placeholder = @"Name can not be empty.";
        return;
    }
    //创建 managed object context
    CDAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    //获取entity description
    NSEntityDescription *entityDesc = [NSEntityDescription 
                                       entityForName:@"Contacts" 
                                       inManagedObjectContext:context];
    
    //获取fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    //获取predicate，并设置到request中
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", name.text];
    [request setPredicate:pred];
    
    //执行fetch
    NSManagedObject *match = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count] == 0)
    {
        status.text = @"No matches";
    }
    else
    {
        match = [objects objectAtIndex:0];
        address.text = [match valueForKey:@"address"];
        phone.text = [match valueForKey:@"phone"];
        status.text = [NSString stringWithFormat:@"%d matches found", [objects count]];
    }
}
//私有方法的实现
-(void) hideKeyboard
{
    [name resignFirstResponder];
    [address resignFirstResponder];
    [phone resignFirstResponder];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    status.text = @"";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
