// static_example.cpp
// g++ -O2 static_example.cpp -o test_static
#include <iostream>
#include <chrono>

// Without static - reinitialized each call
int counter_no_static() {
    int count = 0;
    count++;
    return count;
}

// With static - persistent between calls
int counter_with_static() {
    static int count = 0;
    count++;
    return count;
}

// Static local for caching
double compute_expensive(int x) {
    static double cache[100]{0};
    static bool computed[100]{false};
    
    if (x >= 0 && x < 100) {
        if (!computed[x]) {
            // Simulate expensive computation
            double result = 0;
            for (int i = 0; i < 1000; ++i) {
                result += (x * i) / 1000.0;
            }
            cache[x] = result;
            computed[x] = true;
        }
        return cache[x];
    }
    return 0;
}

int main() {
    std::cout << "No static (always 1): ";
    for (int i = 0; i < 5; ++i) {
        std::cout << counter_no_static() << " ";
    }
    std::cout << "\n";
    
    std::cout << "With static (increments): ";
    for (int i = 0; i < 5; ++i) {
        std::cout << counter_with_static() << " ";
    }
    std::cout << "\n";
    
    // Test caching
    auto start = std::chrono::high_resolution_clock::now();
    double total = 0;
    for (int i = 0; i < 10000; ++i) {
        total += compute_expensive(i % 10);  // Only 10 unique values
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "Cached computation time: " << duration.count() << " us\n";
    std::cout << "Total: " << total << "\n";
    
    return 0;
    // Ruslan, don`t forget to say about the memory segments. (.data/.bss instead of stack)
}
