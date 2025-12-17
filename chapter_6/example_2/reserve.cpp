// reserve.cpp
//          g++ -O3 reserve.cpp -o test_reserve
#include <iostream>
#include <vector>
#include <chrono>

int main() {
    const int N = 10000000;
    
    // WITHOUT reserve
    auto start = std::chrono::high_resolution_clock::now();
    std::vector<int> v1;
    for (int i = 0; i < N; ++i) {
        v1.push_back(i);  // Multiple reallocations
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto time_no_reserve = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    // WITH reserve
    start = std::chrono::high_resolution_clock::now();
    std::vector<int> v2;
    v2.reserve(N);  // Single allocation
    for (int i = 0; i < N; ++i) {
        v2.push_back(i);
    }
    end = std::chrono::high_resolution_clock::now();
    auto time_reserve = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    std::cout << "No reserve: " << time_no_reserve.count() << " ms\n";
    std::cout << "With reserve: " << time_reserve.count() << " ms\n";
    std::cout << "Speedup: " << (double)time_no_reserve.count()/time_reserve.count() << "x\n";
    
    return 0;
}
