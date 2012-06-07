//
//  main.m
//  fast-enumeration
//
//  Created by Yahoo on 6/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        //NSArray supports fast enumeration
        NSArray *array = [NSArray arrayWithObjects: @"one", @"two", @"three", nil];
        for (NSString *element in array)
        {
            NSLog(@"element: %@", element);
        }
        
        //NSDictionary supports fast enumeration
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys: @"quattuor", @"four", @"quinque", @"five", @"sex", @"six", nil];
        NSString *key;
        for (key in dictionary) {
            NSLog(@"English: %@, Latin: %@", key, [dictionary objectForKey:key]);
        }
        
        //NSEnumerator supports fast enumeration
        NSArray *ary = [NSArray arrayWithObjects: @"one", @"two", @"three", @"four", nil];
        NSEnumerator *enumerator = [ary reverseObjectEnumerator];
        for (NSString *element in enumerator) {
            if ([element isEqualToString:@"three"]) {
                break;
            }
        }
        NSString *next = [enumerator nextObject];
        NSLog(@"now is %@", next);
    }
    return 0;
}

