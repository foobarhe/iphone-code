/*
 copying objs has to implement protocol/interface NSCopying.
 implementing the method copyWithZone
 */

#import <Foundation/Foundation.h>

@interface Foo : NSObject <NSCopying>
{
@public
    int bar;
    int *p;
}
@end
