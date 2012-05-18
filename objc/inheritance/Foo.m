#import <stdio.h>
#import "Foo.h"

@implementation Foo
-(id) init {
    //call parent method
    self = [super init];
    if (self) {
        printf("parent init called\n");
    }
    return self;
}
@end

@implementation Bar
@end
