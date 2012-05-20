#import "Foo.h"

//using anonymous category to define private methods
@interface Foo()
-(void) double;
@end

@implementation Foo
-(void) set:(int)v
{
    bar = v;
}
-(int) get
{
    [self double];
    return bar;
}
-(void) double
{
    bar = bar * 2;
}
@end