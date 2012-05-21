#import "Foo.h"
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSString *str = @"abc123";
    NSLog(@"str = %@", str);
        
    str = [str removeNumbersFromString:str];
    NSLog(@"str = %@", str);        
    
    [str release];    
    return 0;
}

