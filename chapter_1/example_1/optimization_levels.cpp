// optimization_levels.cpp
// for the good fellas (Hey Leonid Borisovich! Hey Daniil Vladimirovich! Hey Aleksey Petrov and others!)
//          g++ -O0 optimization_levels.cpp -o test_o0
//          g++ -O2 optimization_levels.cpp -o test_o2
//          g++ -O3 optimization_levels.cpp -o test_o3
#include <iostream>
#include <chrono>

int compute(int n)
{
    int result = 0;
    for (int i = 0; i < n; ++i)
    {
        result += i * i;
    }
    return result;
}

int main()
{
    auto start = std::chrono::high_resolution_clock::now();

    int total = 0;
    for (int j = 0; j < 1000; ++j)
    {
        total += compute(10000);
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    std::cout << "Result: " << total << "\n";
    std::cout << "Time: " << duration.count() << " ms\n";

    // GNU ASM:     g++ -S -O0 optimization_levels.cpp -o o0.s
    //              g++ -S -O3 optimization_levels.cpp -o o3.s
    return 0;
}
