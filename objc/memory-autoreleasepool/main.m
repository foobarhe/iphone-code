/*
* garbage collection: autoreleasepool.
* Note: GC is not available in iOS, only in Mac OS X.
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    @autoreleasepool {
        /*
        //可以显式地进行memory management
        NSString *str = [[NSString alloc] initWithFormat:@"This is a str"];
        NSLog(@"ref count = %lu", [str retainCount]);
        
        NSString *nStr = str;
        [str retain];
        NSLog(@"ref count = %lu", [str retainCount]);
        
        nStr = nil;
        [str release];
        NSLog(@"ref count = %lu", [str retainCount]);
        
        [str release];
        */
        //也可以完全不需要memory management, autoreleasepool会管理
        NSString *str = [[NSString alloc] initWithFormat:@"This is a str"];
        NSString *nStr = str;
        nStr = nil;
    }
    return 0;
}
