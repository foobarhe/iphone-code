/*
objc only support single inheritance.
*/

#import <Foundation/Foundation.h>

@interface Foo : NSObject

-(id) init;
@end

@interface Bar : Foo
@end