// register_deprecated.cpp
// Compile with different standards:
// g++ -std=c++11 register_deprecated.cpp -o test_cpp11
// g++ -std=c++17 register_deprecated.cpp -o test_cpp17
// Note: register ignored since C++17
#include <iostream>

int main() {
    // C++98 style - hint to put in register
    register int fast_counter = 0;
    
    // Modern C++ - compiler decides automatically
    int auto_counter = 0;
    
    // Both should generate similar assembly in modern compilers
    for (int i = 0; i < 1000000; ++i) {
        fast_counter += i;
        auto_counter += i;
    }
    
    std::cout << "Register variable: " << fast_counter << "\n";
    std::cout << "Auto variable: " << auto_counter << "\n";
    
    // This would be an error in C++17 and newer:
    register int* ptr = &fast_counter; // Cannot take address of register variable
    
    return 0;
}
