// move.cpp
//          g++ -O3 move.cpp -o test_move
#include <iostream>
#include <vector>
#include <chrono>
#include <string>
#include <utility>

class Heavy {
    std::string data;
public:
    Heavy(const std::string& s) : data(s) {}
    Heavy(const Heavy& other) : data(other.data) {
        std::cout << "Copy constructor\n";
    }
    Heavy(Heavy&& other) noexcept : data(std::move(other.data)) {
        std::cout << "Move constructor\n";
    }
};

int main() {
    std::vector<Heavy> vec;
    vec.reserve(10);
    
    Heavy heavy("very long string data here");
    
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 5; ++i) {
        vec.push_back(heavy);  // Copy
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto copy_time = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    vec.clear();
    
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 5; ++i) {
        vec.push_back(std::move(heavy));  // Move
    }
    end = std::chrono::high_resolution_clock::now();
    auto move_time = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "Copy: " << copy_time.count() << " us\n";
    std::cout << "Move: " << move_time.count() << " us\n";
    
    return 0;
}
