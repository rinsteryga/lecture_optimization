// volatile_example.cpp
//          g++ -O0 volatile_example.cpp -o test_volatile_o0
//          g++ -O3 volatile_example.cpp -o test_volatile_o3
#include <iostream>
#include <chrono>

volatile bool g_volatile_flag = false;
bool g_normal_flag = false;

void wait_volatile() {
    int count = 0;
    while (!g_volatile_flag) {
        count++;
    }
    std::cout << "Volatile loop count: " << count << "\n";
}

void wait_normal() {
    int count = 0;
    while (!g_normal_flag) {
        count++;
    }
    std::cout << "Normal loop count: " << count << "\n";
}

int test_optimization() {
    volatile int v_counter = 0;
    int normal_counter = 0;
    
    v_counter = 1;
    v_counter = 2;
    v_counter = 3;
    
    normal_counter = 1;
    normal_counter = 2;
    normal_counter = 3;
    
    return v_counter + normal_counter;
}

int main() {
    std::cout << "Volatile test value: " << test_optimization() << "\n";
    
    // Warning for my fellas: Don't actually run wait loops - they're infinite! (Hey to Lazarenko)
    // They're here to show assembly difference
    
    //GNU ASM:      
    //          g++ -O0 -S volatile_example.cpp -o test_volatile_o0
    //          g++ -O3 -S volatile_example.cpp -o test_volatile_o3
    return 0;
}
