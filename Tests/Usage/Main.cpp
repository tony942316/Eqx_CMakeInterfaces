#include <format>
#include <ranges>
#include <iostream>
#include <latch>
#include <thread>
#include <algorithm>
#include <random>
#include <vector>
#include <string>
#include <string_view>
#include <array>
#include <span>
#include <cmath>
#include <functional>

int main([[maybe_unused]] int argc, [[maybe_unused]] char* argv[])
{
    auto rd = std::random_device{};
    auto seed = std::seed_seq{ rd(), rd(), rd(), rd(), rd(), rd() };
    auto random_num = std::bind(std::uniform_int_distribution<int>{0, 9},
        std::mt19937_64{seed});
    auto values = std::array<int, 25>{};
    std::ranges::generate(values, random_num);
    std::ranges::for_each(values, [](const int x) { std::cout << x << ' '; });
    std::cout << '\n';
    return EXIT_SUCCESS;
}
