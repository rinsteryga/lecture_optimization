// noreturn_example.cpp
//          g++ -mconsole -O0 noreturn_example.cpp -o test_noreturn_o0
//          g++ -mconsole -O2 noreturn_example.cpp -o test_noreturn_o2
// Let`s check ASM: g++ -S -O2 noreturn_example.cpp -o noreturn.s // ctrl + f - "fatal"
#include <iostream>
#include <cstdlib>

// With [[noreturn]] - compiler knows function never returns
[[noreturn]] void fatal_error_noreturn(const char* msg) {
    std::cerr << "FATAL: " << msg << "\n";
    std::exit(1);
}

// Without [[noreturn]] - compiler doesn't know
void fatal_error_normal(const char* msg) {
    std::cerr << "FATAL: " << msg << "\n";
    std::exit(1);
}

// Function that uses noreturn
void test_noreturn(int x) {
    if (x < 0) {
        fatal_error_noreturn("Negative value");
        // Compiler knows this is unreachable
        std::cout << "This code is removed by optimizer\n";
    }
    std::cout << "x is positive: " << x << "\n";
}

// Function without noreturn
void test_normal(int x) {
    if (x < 0) {
        fatal_error_normal("Negative value");
        // Compiler might not optimize this away
        std::cout << "This might not be removed\n";
    }
    std::cout << "x is positive: " << x << "\n";
}

// Example where optimization matters
int compute_safe(int x) {
    if (x > 1000) {
        fatal_error_noreturn("Value too large");
    }
    
    // With noreturn, compiler knows x <= 1000 here
    // Can perform additional optimizations
    return x * 2;
}

int main() {
    std::cout << "Testing [[noreturn]] optimization\n\n";
    
    std::cout << "Test with positive value:\n";
    test_noreturn(10);
    test_normal(10);
    
    std::cout << "\nTest with negative value (program will exit):\n";
    
    // Uncomment to see the effect
    // test_noreturn(-5);  // Will exit, unreachable code optimized away
    // test_normal(-5);    // Will exit
    
    std::cout << "\nComputation result: " << compute_safe(500) << "\n";
    
    return 0;
}