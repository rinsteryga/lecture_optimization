// constexpr_example.cpp
//          g++ -O2 constexpr_example.cpp -o test_constexpr
#include <iostream>
#include <chrono>
#include <array>

// Runtime factorial (no optimization)
int factorial_runtime(int n) {
    if (n <= 1) return 1;
    return n * factorial_runtime(n - 1);
}

// Compile-time factorial (C++11)
constexpr int factorial_constexpr(int n) {
    return n <= 1 ? 1 : n * factorial_constexpr(n - 1);
}

// Compile-time factorial (C++14 extended constexpr)
constexpr int factorial_constexpr14(int n) {
    int result = 1;
    for (int i = 2; i <= n; ++i) {
        result *= i;
    }
    return result;
}

int main() {
    // Runtime calculation - happens during execution
    auto start = std::chrono::high_resolution_clock::now();
    int runtime_val = factorial_runtime(10);
    auto end = std::chrono::high_resolution_clock::now();
    auto runtime_duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
    
    // Compile-time calculation - already computed by compiler
    start = std::chrono::high_resolution_clock::now();
    constexpr int compiletime_val = factorial_constexpr(10);
    end = std::chrono::high_resolution_clock::now();
    auto compiletime_duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
    
    // Using compile-time value in runtime context
    start = std::chrono::high_resolution_clock::now();
    int compiletime14_val = factorial_constexpr14(10);
    end = std::chrono::high_resolution_clock::now();
    auto compiletime14_duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
    
    std::cout << "Runtime factorial(10): " << runtime_val 
              << " in " << runtime_duration.count() << " ns\n";
    std::cout << "Constexpr factorial(10): " << compiletime_val 
              << " in " << compiletime_duration.count() << " ns\n";
    std::cout << "Constexpr14 factorial(10): " << compiletime14_val 
              << " in " << compiletime14_duration.count() << " ns\n";
    
    // Compile-time array initialization
    constexpr int arr_size = 100;
    
    constexpr auto make_precomputed_array = []() -> std::array<int, 100> {
        std::array<int, 100> temp = {};
        for (int i = 0; i < 100; ++i) {
            temp[i] = i * i;  // Squares computed at compile-time
        }
        return temp;
    };
    
    constexpr auto precomputed_array = make_precomputed_array();
    
    std::cout << "Precomputed square of 15: " << precomputed_array[15] << "\n";
    
    return 0;
}
