#import "Foo.h"

@implementation Foo

+(int) getCount {
	return count;
}

-(id) init:(int)c:(int)b1:(int)b2 {
	self = [super init];
	if (self) {
		count = c;
		bar1 = b1;
		bar2 = b2;
	}
	return self;
}
-(void) setBar1:(int)v {
	bar1 = v;
}
-(void) setBar2:(int)v {
	bar2 = v;
}
-(void) setBars:(int)v1:(int)v2 {
	bar1 = v1;
	bar2 = v2;
}
-(int) getBar1 {
	return bar1;
}
-(int) getBar2 {
	return bar2;
}
-(int) sum {
	return bar1 + bar2;
}
@end

