// final_example.cpp
//          g++ -O0 final_example.cpp -o test_final_o0
//          g++ -O3 final_example.cpp -o test_final_o3
// We, good fellas should get the same the 0 microsecond time with O3
#include <iostream>
#include <chrono>

class Base {
public:
    virtual int compute(int x) { return x * 2; }
    virtual ~Base() = default;
};

class Derived final : public Base {
public:
    virtual int compute(int x) override { return x * 3; }
};

class NotFinal : public Base {
public:
    virtual int compute(int x) override { return x * 4; }
};

int process_final(Base* obj, int iterations) {
    int result = 0;
    for (int i = 0; i < iterations; ++i) {
        result += obj->compute(i);
    }
    return result;
}

int main() {
    const int ITERATIONS = 10000000;
    
    Derived d_final;
    NotFinal d_notfinal;
    
    auto start = std::chrono::high_resolution_clock::now();
    int r1 = process_final(&d_final, ITERATIONS);
    auto end = std::chrono::high_resolution_clock::now();
    auto duration1 = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    start = std::chrono::high_resolution_clock::now();
    int r2 = process_final(&d_notfinal, ITERATIONS);
    end = std::chrono::high_resolution_clock::now();
    auto duration2 = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << "Final class: " << duration1.count() << " us\n";
    std::cout << "Not final: " << duration2.count() << " us\n";
    
    return 0;
}
