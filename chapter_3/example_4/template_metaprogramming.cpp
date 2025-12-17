// template_metaprogramming.cpp
//              g++ -O0 template_metaprogramming.cpp -o test_templates
#include <iostream>
#include <chrono>
#include <array>

// Traditional runtime power calculation
double power_runtime(double base, int exponent) {
    double result = 1.0;
    for (int i = 0; i < exponent; ++i) {
        result *= base;
    }
    return result;
}

// Template metaprogramming for compile-time power (C++11 style)
template<int Exponent>
struct Power {
    template<typename T>
    static constexpr T compute(T base) {
        return base * Power<Exponent - 1>::compute(base);
    }
};

template<>
struct Power<0> {
    template<typename T>
    static constexpr T compute(T base) {
        return T(1);
    }
};

// C++17 constexpr if version (cleaner)
template<int N>
constexpr double power_constexpr(double base) {
    if constexpr (N == 0) return 1.0;
    else if constexpr (N == 1) return base;
    else if constexpr (N % 2 == 0) {
        double half = power_constexpr<N/2>(base);
        return half * half;
    } else {
        return base * power_constexpr<N-1>(base);
    }
}

// Template value parameters - computed at compile-time
template<typename T, T Value>
struct CompileTimeConstant {
    static constexpr T value = Value;
};

// Using template parameters as compile-time values
template<int N>
constexpr std::array<int, N> generate_fibonacci() {
    std::array<int, N> result{};
    if constexpr (N > 0) result[0] = 1;
    if constexpr (N > 1) result[1] = 1;
    
    for (size_t i = 2; i < N; ++i) {
        result[i] = result[i-1] + result[i-2];
    }
    return result;
}

int main() {
    // All these are computed at compile-time
    constexpr double compile_time_pow = Power<5>::compute(2.0);
    constexpr double compile_time_pow2 = power_constexpr<5>(2.0);
    constexpr auto fib_sequence = generate_fibonacci<20>();
    
    std::cout << "Compile-time 2^5 (template): " << compile_time_pow << "\n";
    std::cout << "Compile-time 2^5 (constexpr): " << compile_time_pow2 << "\n";
    std::cout << "First 10 Fibonacci numbers (compile-time): ";
    for (int i = 0; i < 10; ++i) {
        std::cout << fib_sequence[i] << " ";
    }
    std::cout << "\n\n";
    
    // Performance comparison
    const int iterations = 10000000;
    double sum1 = 0, sum2 = 0;
    
    // Runtime calculation
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < iterations; ++i) {
        sum1 += power_runtime(1.000001, 10);
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto runtime_duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    // Compile-time calculation (already computed, just adding)
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < iterations; ++i) {
        sum2 += compile_time_pow;  // Just using precomputed value
    }
    end = std::chrono::high_resolution_clock::now();
    auto compiletime_duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "Performance comparison:\n";
    std::cout << "Runtime calculation: " << runtime_duration.count() << " us\n";
    std::cout << "Compile-time lookup: " << compiletime_duration.count() << " us\n";
    std::cout << "Speedup: " << (double)runtime_duration.count() / compiletime_duration.count() << "x\n";
    
    return 0;
}
