#import "Foo.h"
#import <stdio.h>

/*
build: 
  gcc -o res Foo.m main.m -framework Foundation
  ./res
*/

int main (int argc, char *argv[])
{
	Foo *o = [[Foo alloc] init:0:1:2];
	printf("count=%d\n", [Foo getCount]);
	
	int b1;
	int b2;
	b1 = [o getBar1];
	b2 = [o getBar2];
	printf("b1 = %d, b2 = %d\n", b1, b2);
	
	[o setBar1:10];
	[o setBar2:20];
	b1 = [o getBar1];
	b2 = [o getBar2];
	printf("b1 = %d, b2 = %d\n", b1, b2);
	
	[o setBars:100:200];
	b1 = [o getBar1];
	b2 = [o getBar2];
	printf("b1 = %d, b2 = %d\n", b1, b2);
	
	int s;
	s = [o sum];
	printf("sum = %d\n", s);
	
	printf("b1 = %d, b2 = %d\n", o->bar1, [o getBar2]);
	[o release];
	return 0;
}