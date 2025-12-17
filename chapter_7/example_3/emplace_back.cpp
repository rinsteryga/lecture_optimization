// emplace_back.cpp
//          g++ -O0 emplace_back.cpp -o emplace_back
#include <iostream>
#include <vector>
#include <chrono>

class Point {
    int x, y, z;
public:
    Point(int a, int b, int c) : x(a), y(b), z(c) {}
};

int main() {
    const int N = 1000000;
    
    std::vector<Point> v1;
    v1.reserve(N);
    
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < N; ++i) {
        v1.push_back(Point(i, i+1, i+2));  // Temporary + move/copy
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto push_time = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::vector<Point> v2;
    v2.reserve(N);
    
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < N; ++i) {
        v2.emplace_back(i, i+1, i+2);  // Construct in-place
    }
    end = std::chrono::high_resolution_clock::now();
    auto emplace_time = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "push_back: " << push_time.count() << " us\n";
    std::cout << "emplace_back: " << emplace_time.count() << " us\n";
    std::cout << "Speedup: " << (double)push_time.count()/emplace_time.count() << "x\n";
    
    return 0;
}
