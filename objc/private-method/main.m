#import "Foo.h"

int main(int argc, char *argv[])
{
    Foo *f = [[Foo alloc] init];
    [f set: 10];
    
    NSLog(@"bar = %d", [f get]);
    
    //[f double]; //will trigger warning when build
    return 0;
}