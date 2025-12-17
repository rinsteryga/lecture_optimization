// noexcept_example_fixed.cpp
//          g++ -O0 noexcept_example.cpp -o test_noexceptO0
//          g++ -O3 noexcept_example.cpp -o test_noexceptO3
#include <iostream>
#include <vector>
#include <chrono>

class MovableNoExcept {
public:
    size_t size;
    int* data;
    
    MovableNoExcept(size_t s) : size(s), data(new int[s]) {}
    
    // COPY constructor
    MovableNoExcept(const MovableNoExcept& other) : size(other.size), data(new int[other.size]) {
        std::copy(other.data, other.data + size, data);
    }
    
    // MOVE constructor with noexcept 
    MovableNoExcept(MovableNoExcept&& other) noexcept 
        : size(other.size), data(other.data) {
        other.data = nullptr;
        other.size = 0;
    }
    
    ~MovableNoExcept() { delete[] data; }
};

class MovableWithExcept {
public:
    size_t size;
    int* data;
    
    MovableWithExcept(size_t s) : size(s), data(new int[s]) {}
    
    // COPY constructor
    MovableWithExcept(const MovableWithExcept& other) : size(other.size), data(new int[other.size]) {
        std::copy(other.data, other.data + size, data);
    }
    
    // MOVE constructor WITHOUT noexcept
    MovableWithExcept(MovableWithExcept&& other)  // No noexcept!
        : size(other.size), data(other.data) {
        other.data = nullptr;
        other.size = 0;
    }
    
    ~MovableWithExcept() { delete[] data; }
};

int main() {
    const int N = 100000;
    
    // Test with noexcept move
    {
        std::vector<MovableNoExcept> vec;
        vec.reserve(N/10);  // Force reallocations
        
        auto start = std::chrono::high_resolution_clock::now();
        for (int i = 0; i < N; ++i) {
            vec.emplace_back(1000);
        }
        auto end = std::chrono::high_resolution_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
        std::cout << "With noexcept: " << duration.count() << " us\n";
    }
    
    // Test without noexcept
    {
        std::vector<MovableWithExcept> vec;
        vec.reserve(N/10);  // Force reallocations
        
        auto start = std::chrono::high_resolution_clock::now();
        for (int i = 0; i < N; ++i) {
            vec.emplace_back(1000);
        }
        auto end = std::chrono::high_resolution_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
        std::cout << "Without noexcept: " << duration.count() << " us\n";
    }
    
    return 0;
}