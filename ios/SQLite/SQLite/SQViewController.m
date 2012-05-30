//
//  SQViewController.m
//  SQLite
//
//  Created by  on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SQViewController.h"

@interface SQViewController ()
//定义一个私有方法
-(void) hideKeyboard;
@end

@implementation SQViewController
@synthesize name, address, phone, result;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //确认db file是否存在，如果不存在则创建文件和table
    
    //获取app的document目录
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    //获取文件名
    dbfile = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"contacts.db"]];

    result.text = @"";
    //判断文件是否存在
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath:dbfile] == NO)
    {
        //创建table
        const char *dbFileStr = [dbfile UTF8String];
        if (sqlite3_open(dbFileStr, &db) == SQLITE_OK)
        {
            char *errMsg;
            const char *createSQL = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)";
            if (sqlite3_exec(db, createSQL, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                result.text = @"Failed to create table";
            }
            sqlite3_close(db);
        }
        else 
        {
            result.text = @"Failed to open/create database.";
        }
    }
}

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
    
    //将界面的内容保存到数据库中
    const char *dbFileStr = [dbfile UTF8String];
    if (sqlite3_open(dbFileStr, &db) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO CONTACTS(name, address, phone) VALUES (\"%@\", \"%@\", \"%@\")", 
                               name.text, address.text, phone.text];
                                                              
        const char *insertSQLStr = [insertSQL UTF8String];
        sqlite3_stmt *statement;
        sqlite3_prepare_v2(db, insertSQLStr, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            result.text = @"Contact added!";
            name.text = @"";
            address.text = @"";
            phone.text = @"";
        }
        else 
        {
            result.text = @"Failed to add contact";
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
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

    //将界面的内容保存到数据库中
    const char *dbFileStr = [dbfile UTF8String];
    if (sqlite3_open(dbFileStr, &db) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT address, phone FROM contacts WHERE name=\"%@\"", 
                              name.text];
        const char *querySQLStr = [querySQL UTF8String];
        sqlite3_stmt *statement;

        if (sqlite3_prepare_v2(db, querySQLStr, -1, &statement, NULL) == SQLITE_OK)
        {       
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *addressResult = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                NSString *phoneResult = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                address.text = addressResult;
                phone.text = phoneResult;
                result.text = @"Match found";
            }
            else 
            {
                address.text = @"";
                phone.text = @"";
                result.text = @"Match not found";
            }
            sqlite3_finalize(statement);
            
        }
        sqlite3_close(db);
    }    
}
//私有方法的实现
-(void) hideKeyboard
{
    [name resignFirstResponder];
    [address resignFirstResponder];
    [phone resignFirstResponder];
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
