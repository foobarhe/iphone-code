//
//  main.m
//  ARC
//
//  Created by Yahoo on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    /*
    ARC will do the reference counting. Don't need to call retain/release etc.
     */
    
    NSString *str = [[NSString alloc] initWithFormat:@"This is a str"];
    NSString *nStr = str;
    nStr = nil;
    
    /*
    //ARC can be used together with GC
    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
    }
    */
    
    return 0;
}

