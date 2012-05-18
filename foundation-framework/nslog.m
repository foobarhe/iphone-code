#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    int d = 10;
    float f = 1.11;
    NSString *str = @"this is a constant string";
    
    //NSLog will output the formatted data    
    NSLog(@"the output: %d, %f, %@\n", d, f, str);
    return 0;
}