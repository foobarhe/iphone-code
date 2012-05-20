#import <Foundation/Foundation.h>

/*
* Manual Reference Counting: alloc/retain/release/dealloc
*/

int main(int argc, char *argv[])
{
    NSString *str = [[NSString alloc] initWithFormat:@"This is a str"];
    NSLog(@"ref count = %lu", [str retainCount]);   //1
    
    NSString *nStr = str;
    [str retain];
    NSLog(@"ref count = %lu", [str retainCount]);   //2
    
    nStr = nil;
    [str release];
    NSLog(@"ref count = %lu", [str retainCount]);   //1
    
    [str release];  //retain count will be 0, and dealloc will be called.
    //NSLog(@"ref count = %d", [str retainCount]);  //so here isn't 0 but random value.
    
    return 0;
}