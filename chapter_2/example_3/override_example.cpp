// override_example.cpp
//          g++ override_example.cpp -o test_override
#include <iostream>

class Base {
public:
    virtual void foo(int x) { std::cout << "Base::foo(" << x << ")\n"; }
    virtual void bar() const { std::cout << "Base::bar()\n"; }
};

class DerivedGood : public Base {
public:
    virtual void foo(int x) override { std::cout << "Derived::foo(" << x << ")\n"; }
    virtual void bar() const override { std::cout << "Derived::bar()\n"; }
};

class DerivedBad : public Base {
public:
    // ERROR: Uncomment to see compile error
    // virtual void foo(double x) override { }
    // virtual void bar() override { }
};

int main() {
    DerivedGood d1;
    Base* b1 = &d1;
    b1->foo(42);
    b1->bar();
    
    return 0;
}