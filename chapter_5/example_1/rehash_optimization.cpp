// rehash_optimization.cpp
//          g++ -std=c++20 -O3 rehash_optimization.cpp -o test_rehash
#include <iostream>
#include <chrono>
#include <unordered_map>

void test_with_rehash(int num_elements) {
    std::unordered_map<int, int> map;
    
    // Without rehash - multiple resizes
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < num_elements; ++i) {
        map[i] = i * i;
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto duration1 = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    // With rehash - single allocation
    std::unordered_map<int, int> map2;
    map2.rehash(num_elements * 1.5);  // Pre-allocate buckets
    
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < num_elements; ++i) {
        map2[i] = i * i;
    }
    end = std::chrono::high_resolution_clock::now();
    auto duration2 = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << num_elements << " elements:\n";
    std::cout << "  No rehash: " << duration1.count() << " us\n";
    std::cout << "  With rehash: " << duration2.count() << " us\n";
    std::cout << "  Speedup: " << (double)duration1.count()/duration2.count() << "x\n\n";
}

int main() {
    test_with_rehash(1000);
    test_with_rehash(10000);
    test_with_rehash(100000);
    
    return 0;
}
// Hey to Daniil again!
