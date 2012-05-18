#import "Foo.h"
#import <stdio.h>

/*
build: 
  gcc -o res Foo.m main.m -framework Foundation
  ./res
*/
int main(int argc, char *argv[]) {
    Foo *o = [[Foo alloc] init];
    
    /*
    without property/synthesize, the public property can only be
    access using o->bar3
    */
    o->bar3 = 100;
    int tmp;
    tmp = o->bar3;
    printf("bar3 = %d\n", tmp);
    
    /*
    with property/synthesize, the public/private/protected property all can be
    accessible using o.propName
    */
    o.bar1 = 1;
    o.bar2 = 1.1;
    [o show];
    
    [o release];
    return 0;
}