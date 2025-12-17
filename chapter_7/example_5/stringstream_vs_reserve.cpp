// stringstream_vs_reserve.cpp
//          g++ -O3 stringstream_vs_reserve.cpp -o test_stringstream_vs_reserve
#include <iostream>
#include <sstream>
#include <chrono>
#include <string>

int main() {
    const int N = 10000;
    
    // Using ostringstream
    auto start = std::chrono::high_resolution_clock::now();
    std::ostringstream oss;
    for (int i = 0; i < N; ++i) {
        oss << "Number: " << i << ", ";
    }
    std::string result1 = oss.str();
    auto end = std::chrono::high_resolution_clock::now();
    auto stream_time = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    // Using string with reserve
    start = std::chrono::high_resolution_clock::now();
    std::string result2;
    result2.reserve(N * 15);  // Estimate size
    for (int i = 0; i < N; ++i) {
        result2 += "Number: ";
        result2 += std::to_string(i);
        result2 += ", ";
    }
    end = std::chrono::high_resolution_clock::now();
    auto reserve_time = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "ostringstream: " << stream_time.count() << " us\n";
    std::cout << "string + reserve: " << reserve_time.count() << " us\n";
    std::cout << "Speedup: " << (double)stream_time.count()/reserve_time.count() << "x\n";
    
    return 0;
}
// That`s all folks! At least for now...
