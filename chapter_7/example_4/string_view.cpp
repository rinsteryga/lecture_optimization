// string_view.cpp
//          g++ -O0 string_view.cpp -o test_string_view
#include <iostream>
#include <string>
#include <string_view>
#include <chrono>

std::string extract_substring(const std::string& s, size_t start, size_t len) {
    return s.substr(start, len);  // New allocation + copy
}

std::string_view extract_view(const std::string& s, size_t start, size_t len) {
    return std::string_view(s.data() + start, len);  // No allocation
}

int main() {
    std::string long_str(100000, 'x');
    const int iterations = 100000;
    
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < iterations; ++i) {
        auto sub = extract_substring(long_str, 10, 20);  // Copy
        (void)sub;
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto substr_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < iterations; ++i) {
        auto view = extract_view(long_str, 10, 20);  // View only
        (void)view;
    }
    end = std::chrono::high_resolution_clock::now();
    auto view_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    std::cout << "substring (copy): " << substr_time.count() << " ms\n";
    std::cout << "string_view (view): " << view_time.count() << " ms\n";
    std::cout << "Speedup: " << (double)substr_time.count()/view_time.count() << "x\n";
    
    return 0;
}
