#import <Foundation/NSObject.h>

//class property defined here
static int count;

@interface Foo : NSObject {
//instance property defined here
@public
	int bar1;
@private
	int bar2;
}

//class method defined with +
+(int) getCount;

//instance method defined with -
-(id) init:(int)c:(int)b1:(int)b2;
-(void) setBar1:(int)v;
-(void) setBar2:(int)v;
-(void) setBars:(int)v1:(int)v2;
-(int) getBar1;
-(int) getBar2;
-(int) sum;

@end

