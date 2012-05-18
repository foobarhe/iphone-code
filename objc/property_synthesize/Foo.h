#import <Foundation/Foundation.h>

@interface Foo : NSObject {
    int bar1;
@public
    float bar2;
    int bar3;
}

@property int bar1;
@property float bar2;

-(void) show;
@end