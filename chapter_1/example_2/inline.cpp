// inline_example.cpp
//          g++ -O0 inline.cpp -o test_no_inline
//          g++ -O3 inline.cpp -o test_with_inline
#include <iostream>
#include <chrono>

// Without inline - function call overhead
int add_noinline(int a, int b) {
    return a + b;
}

// With inline - potential for inlining
inline int add_inline(int a, int b) {
    return a + b;
}

int main() {
    auto start = std::chrono::high_resolution_clock::now();
    
    int sum = 0;
    for (int i = 0; i < 10000000; ++i) {
        // Let`s try both: add_noinline(i, i+1) and add_inline(i, i+1)
        sum += add_noinline(i, i+1);
        // sum += add_inline(i, i+1); // Ruslan, don`t forget to show it!!!
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "Sum: " << sum << "\n";
    std::cout << "Time: " << duration.count() << " us(microseconds)\n";
    
    // GNU ASM: g++ -S -O0 inline.cpp -o noinline.s // already done
    //          g++ -S -O3 inline.cpp -o inline.s
    // Compare call instructions
    return 0;
}
