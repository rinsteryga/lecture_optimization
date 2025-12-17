// swap_and_pop.cpp
//          g++ -O3 swap_and_pop.cpp -o test_swap_and_pop
#include <iostream>
#include <vector>
#include <algorithm>
#include <chrono>

int main() {
    const int N = 1000000;
    std::vector<int> v;
    v.reserve(N);
    
    for (int i = 0; i < N; ++i) {
        v.push_back(i);
    }
    
    // BAD: shifting all elements
    auto start = std::chrono::high_resolution_clock::now();
    std::vector<int> v1 = v;
    for (int i = 0; i < 1000; ++i) {
        // Remove an element at position 500
        v1.erase(v1.begin() + 500);  // O(n) each time
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto time_erase = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    // GOOD: O(1) per removal (order not preserved)
    start = std::chrono::high_resolution_clock::now();
    std::vector<int> v2 = v;
    for (int i = 0; i < 1000; ++i) {
        // Swap with last and pop
        std::swap(v2[500], v2.back());  // O(1)
        v2.pop_back();                   // O(1)
    }
    end = std::chrono::high_resolution_clock::now();
    auto time_swap_pop = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "erase(): " << time_erase.count() << " us\n";
    std::cout << "swap-and-pop: " << time_swap_pop.count() << " us\n";
    std::cout << "Speedup: " << (double)time_erase.count()/time_swap_pop.count() << "x\n";
    
    return 0;
}
