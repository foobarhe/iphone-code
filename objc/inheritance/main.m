#import "Foo.h"

/*
build:
    gcc -o res Foo.m main.m -framework Foundation
    ./res
will output 'parent init called'.
which shows: [[Child alloc] init] will call parent init method automatically.
*/
int main(int argc, char *argv[])
{
    Bar *o = [[Bar alloc] init];
    [o release];
    
    return 0;
}