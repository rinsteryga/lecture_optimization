// consteval_example.cpp
//          g++ -std=c++20 -O2 consteval_example.cpp -o test_consteval
#include <iostream>
#include <array>
#include <chrono>

// Can be either compile-time or runtime
constexpr int square_constexpr(int x) {
    return x * x;
}

// MUST be evaluated at compile-time (C++20)
consteval int square_consteval(int x) {
    return x * x;
}

// Runtime function for comparison
int square_runtime(int x) {
    return x * x;
}

int main() {
    // These are compile-time values
    // Note: `consteval` applies to functions (immediate functions) and cannot be used to declare variables.
    // Use `constexpr` for variables that must be compile-time constants.
    constexpr int constexpr_val = square_constexpr(5);      // OK
    constexpr int consteval_val = square_consteval(5);      // OK
    
    // Runtime variable - cannot use consteval here
    // int runtime_input = 15;
    // int bad = square_consteval(runtime_input);  // Error! Not compile-time
    
    // Performance comparison
    const int iterations = 10000000;
    int sum = 0;
    
    // Test 1: Runtime calculation
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < iterations; ++i) {
        sum += square_runtime(i % 100);
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto runtime_duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    // Test 2: Using compile-time precomputed array
    start = std::chrono::high_resolution_clock::now();
    
    // Precompute all squares at compile-time
    constexpr std::array<int, 100> precomputed_squares = []() {
        std::array<int, 100> arr{};
        for (size_t i = 0; i < arr.size(); ++i) {
            arr[i] = square_consteval(static_cast<int>(i));  // Compile-time!
        }
        return arr;
    }();
    
    for (int i = 0; i < iterations; ++i) {
        sum += precomputed_squares[i % 100];  // Just array lookup!
    }
    end = std::chrono::high_resolution_clock::now();
    auto compiletime_duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "Total sum: " << sum << "\n";
    std::cout << "Runtime calculation: " << runtime_duration.count() << " us\n";
    std::cout << "Compile-time lookup: " << compiletime_duration.count() << " us\n";
    std::cout << "Speedup: " << (double)runtime_duration.count() / compiletime_duration.count() << "x\n";
    
    return 0;
}
