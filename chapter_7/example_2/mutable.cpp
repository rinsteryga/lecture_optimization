// mutable.cpp
//          g++ -O0 mutable.cpp -o test_mutable
#include <iostream>
#include <chrono>
#include <cmath>

class ExpensiveCalculation {
    mutable double cached_value;
    mutable bool cached = false;
    double x;
    
public:
    ExpensiveCalculation(double val) : x(val) {}
    
    double compute() const {
        if (!cached) {
            // Simulate expensive computation
            for (int i = 0; i < 1000000; ++i) {
                cached_value = std::sin(x) * std::cos(x) * std::exp(x);
            }
            cached = true;
        }
        return cached_value;
    }
};

int main() {
    const ExpensiveCalculation calc(2.5);
    
    // First call - expensive
    auto start = std::chrono::high_resolution_clock::now();
    double result1 = calc.compute();
    auto end = std::chrono::high_resolution_clock::now();
    auto first_time = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    // Second call - cached
    start = std::chrono::high_resolution_clock::now();
    double result2 = calc.compute();
    end = std::chrono::high_resolution_clock::now();
    auto second_time = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "First compute: " << first_time.count() << " us\n";
    std::cout << "Cached compute: " << second_time.count() << " us\n";
    std::cout << "Speedup: " << (double)first_time.count()/second_time.count() << "x\n";
    
    return 0;
}
