#import <stdio.h>
#import "Foo.h"

@implementation Foo

@synthesize bar1, bar2;

-(void) show {
    printf("bar1 = %d, bar2 = %f\n", bar1, bar2);
}

@end