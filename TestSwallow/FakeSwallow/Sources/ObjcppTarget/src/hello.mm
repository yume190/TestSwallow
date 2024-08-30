#import "hello.hpp"
#include <iostream>

@implementation HelloWorld2

- (void)sayHello {
    // Using C++ for printing
    std::cout << "Hello, World from C++!" << std::endl;

    // Using Objective-C for printing
    NSLog(@"Hello, World from Objective-C!");
}

@end
