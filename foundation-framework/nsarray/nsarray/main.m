//
//  main.m
//  nsarray
//
//  Created by  on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //数组的数组
        NSArray *p1 = [[NSArray alloc] initWithObjects:@"kobe.jpg", @"湖人", @"后卫, 1.98", nil];
        NSArray *p2 = [[NSArray alloc] initWithObjects:@"james.jpg", @"热队", @"前锋, 2.03", nil];
        NSArray *p3 = [[NSArray alloc] initWithObjects:@"wade.jpg", @"热队", @"后卫, 1.93", nil];
        NSArray *p4 = [[NSArray alloc] initWithObjects:@"howard.jpg", @"魔术队", @"中锋, 2.11", nil];
        NSArray *p5 = [[NSArray alloc] initWithObjects:@"durant.jpg", @"雷霆队", @"前锋, 2.06", nil];
        NSArray *p6 = [[NSArray alloc] initWithObjects:@"paul.jpg", @"快船队", @"后卫, 1.83", nil];
        NSArray *p7 = [[NSArray alloc] initWithObjects:@"griffin.jpg", @"快船队", @"前锋, 2.08", nil];
        
        NSArray *data = [[NSArray alloc] initWithObjects: p1, p2, p3, p4, p5, p6, p7, nil];
        
        int size = [data count];
        int i;
        NSArray *tmp;
        for (i = 0; i < size; i++)
        {
            tmp = [data objectAtIndex:i];
            NSLog(@"%d: %@, %@, %@", i, [tmp objectAtIndex:0], [tmp objectAtIndex:1], [tmp objectAtIndex:2]);
        }        
    }
    return 0;
}

