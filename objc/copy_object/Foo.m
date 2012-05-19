#import "Foo.h"
@implementation Foo

-(id) copyWithZone: (NSZone *)zone
{
    Foo *o = [[[self class] allocWithZone:zone] init];
    //Foo *o = [[Foo allocWithZone:zone] init];

    o->bar = bar;
    o->p = p;
    
    return o;
}
@end