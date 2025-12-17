// constinit_example.cpp
//              g++ -std=c++20 -O0 constinit_example.cpp -o test_constinit
#include <iostream>
#include <array>
#include <chrono>

// Traditional static initialization (could be dynamic)
int traditional_init() {
    static int value = 42;  // Might have runtime overhead
    return value;
}

// Guaranteed static initialization (no runtime cost)
constexpr int compute_constexpr() {
    return 7 * 6;  // Computed at compile-time
}

constinit static int guaranteed_init = compute_constexpr();  // Zero runtime cost

// Complex constinit + constexpr example
struct Point {
    int x, y;
    constexpr Point(int x, int y) : x(x), y(y) {}
    
    constexpr int magnitude() const {
        return x * x + y * y;
    }
};

// Constinit with complex types
constexpr static Point p{3, 4};
constinit static int point_magnitude = p.magnitude();

int main() {
    auto start = std::chrono::high_resolution_clock::now();
    
    // Access constinit variables - no initialization overhead
    int total = 0;
    for (int i = 0; i < 10000000; ++i) {
        total += guaranteed_init;           // Direct access
        total += point_magnitude;           // Precomputed value
        total += traditional_init();        // Function call with static init check
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "Total: " << total << "\n";
    std::cout << "Time: " << duration.count() << " us\n";
    
    // GNU ASM:
    //          g++ -std=c++20 -S -O0 constinit_example.cpp -o constinit.s
    // Look for absence of initialization code in main()
    
    return 0;
}
