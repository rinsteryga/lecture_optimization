// stl_vs_new.cpp
//          g++ -O0 stl_vs_new.cpp -o test_stl_vs_new
#include <iostream>
#include <memory>
#include <chrono>

class Heavy {
    char data[1024];  // 1KB
public:
    Heavy() { std::cout << "Heavy constructed\n"; }
    ~Heavy() { std::cout << "Heavy destroyed\n"; }
};

int main() {
    const int N = 10000;
    
    // BAD: Two allocations (object + control block)
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < N; ++i) {
        std::shared_ptr<Heavy> p(new Heavy());  // 2 allocations
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto time_new = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    // GOOD: Single allocation (object + control block together)
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < N; ++i) {
        auto p = std::make_shared<Heavy>();  // 1 allocation
    }
    end = std::chrono::high_resolution_clock::now();
    auto time_make = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    std::cout << "shared_ptr(new): " << time_new.count() << " ms\n";
    std::cout << "make_shared(): " << time_make.count() << " ms\n";
    std::cout << "Speedup: " << (double)time_new.count()/time_make.count() << "x\n";
    std::cout << "\nAlso prevents memory leaks:\n";
    std::cout << "void foo(int x) {\n";
    std::cout << "  process(std::shared_ptr<Heavy>(new Heavy), bar());\n";
    std::cout << "  // If bar() throws, memory leak!\n";
    std::cout << "}\n";
    
    return 0;
}
