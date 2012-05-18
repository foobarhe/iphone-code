#import "Foo.h"

/*
build: 
  gcc -o res Foo.m main.m -framework Foundation
  ./res
*/

int main (int argc, char *argv[])
{
    Foo *o = [[Foo alloc] init:100];
    
    NSLog(@"k = %d", [o get]);
    
    [o set:200];
    NSLog(@"k = %d", [o get]);
    
    [o release];
    return 0;
}