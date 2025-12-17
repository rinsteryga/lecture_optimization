// Reallocation.cpp
//          g++ -std=c++20 -O0 reallocation.cpp -o test_reallocation
#include <iostream>
#include <vector>

int main() {    
    std::vector<int> v = {1, 2, 3, 4, 5};
    std::cout << "Initial vector: ";
    for (int x : v) std::cout << x << " ";
    std::cout << "\n";
    
    auto it = v.begin() + 2;  // Iterator to element '3'
    std::cout << "*it = " << *it << "\n";
    
    // Save capacity before modification
    size_t old_capacity = v.capacity();
    std::cout << "Capacity before: " << old_capacity << "\n";
    
    // Force reallocation
    v.push_back(6);
    v.push_back(7);
    v.push_back(8);
    v.push_back(9);
    
    if (v.capacity() > old_capacity) {
        std::cout << "Reallocation occurred! Capacity now: " << v.capacity() << "\n";
        std::cout << "WARNING: All iterators are invalidated!\n";
        
        // DANGER: Using invalid iterator (Undefined Behavior)
        // std::cout << "*it after reallocation = " << *it << " (UB!)\n";
        
        std::cout << "Correct way - use index or get new iterator:\n";
        std::cout << "v[2] = " << v[2] << "\n";  // Safe
    }
    
    return 0;
}
