/*
protocol is like interface
*/
#import <Foundation/Foundation.h>

//define the protocol
@protocol Bar
-(void) set:(int)v;
-(int) get;
@end

//define the class Foo which implements the protocol/interface Bar
@interface Foo : NSObject <Bar>
{
@private
    int k;
}
-(id) init:(int)v;
@end