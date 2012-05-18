#import "Foo.h"

@implementation Foo

-(id) init:(int)v
{
    self = [super init];
    if (self)
    {
        k = v;
    }
    return self;
}

//implements the two methods of the protocol
-(void) set: (int)v
{
    k = v;
}
-(int) get
{
    return k;
}

@end