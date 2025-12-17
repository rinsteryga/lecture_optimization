// const_optimization.cpp
// g++ -O2 const_optimization.cpp -o test_const
#include <iostream>

void process_array(const int *arr, size_t size) {
    // Compiler knows that arr won't change
    int sum = 0;
    for (size_t i = 0; i < size; ++i) {
        sum += arr[i];
    }
    std::cout << "Sum: " << sum << "\n";
}

int main() {
    const int SIZE = 1000000;  // Compiler can propagate constant
    static int data[SIZE];     // Static storage
    
    // Initialize
    for (int i = 0; i < SIZE; ++i) {
        data[i] = i % 100;
    }
    
    process_array(data, SIZE);
    
    // Example of loop optimization with const
    const int iterations = 1000;
    int result = 0;
    
    // Compiler might unroll this loop more aggressively
    for (int i = 0; i < iterations; ++i) {
        result += data[i % SIZE];
    }
    
    std::cout << "Result: " << result << "\n";
    return 0;

    // GNU ASM      g++ -O2 -S .\const_optimization.cpp -o const.s
}
