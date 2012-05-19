#import "Foo.h"

/*
 build:
 gcc -o res Foo.m main.m -framework Foundation
 ./res
 */
int main(int argc, char *argv[])
{
    Foo *o1 = [[Foo alloc] init];
    o1->bar = 10;
    int i = 20;
    o1->p = &i;
    
    //can use copy or mutableCopy method to do object copying
    Foo *o2;
    o2 = [o1 copy];
    o2->bar = 11;
    
    NSLog(@"o1->bar = %d, *(o1->p) = %d, o2->bar = %d, *(o2->p) = %d", o1->bar,
          *(o1->p), o2->bar, *(o2->p));
    
    [o1 release];
    [o2 release];
    
    return 0;
}
