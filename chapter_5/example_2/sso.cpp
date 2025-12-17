// sso.cpp
//          g++ -std=c++20 -O3 sso.cpp -o sso
#include <iostream>
#include <chrono>
#include <string>

void test_string_perf(const char* text) {
    // Small string (fits in SSO buffer)
    auto start = std::chrono::high_resolution_clock::now();
    
    for (int i = 0; i < 1000000; ++i) {
        std::string small_str = text;  // SSO - no heap allocation
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "string '" << text << "': " << duration.count() << " us\n";
}

int main() {
    // SSO works (typically up to 15 chars)
    test_string_perf("short");      // 5 chars - SSO
    test_string_perf("hello world sso"); // 15 chars - SSO
    test_string_perf("this is 16!!!!!!"); // 16 chars - not SSO
    
    // So, in my case sso works with strings up to 15 chars

    // May not fit SSO (depends on implementation)
    test_string_perf("this is definitely longer than SSO buffer"); // Heap allocation
    
    return 0;
}
