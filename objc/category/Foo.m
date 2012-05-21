#import "Foo.h"

@implementation NSString (RemoveNums)

-(NSString *) removeNumbersFromString: (NSString *)str
{
    NSString *trimedStr = nil;
    NSCharacterSet *nums = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    trimedStr = [str stringByTrimmingCharactersInSet:nums];
    return trimedStr;
}

@end