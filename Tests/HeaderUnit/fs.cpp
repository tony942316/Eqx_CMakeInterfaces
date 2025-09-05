// fs.cpp

import <fs.hpp>;

#include <gtest/gtest.h>

TEST(fs, basic)
{
    class Path_Guard
    {
    public:
        Path_Guard(Path_Guard&&) = default;
        Path_Guard& operator= (Path_Guard&&) = default;

        Path_Guard() = delete;
        Path_Guard(const Path_Guard&) = delete;
        Path_Guard& operator= (const Path_Guard&) = delete;

        explicit inline Path_Guard(const std::filesystem::path& p) noexcept
            :
            m_path(p)
        {
        }

        inline ~Path_Guard() noexcept
        {
            auto ec = std::error_code{};
            (void)std::filesystem::remove(this->get_path(), ec);
        }

        [[nodiscard]] inline const std::filesystem::path&
            get_path() const noexcept
        {
            return this->m_path;
        }

    private:
        std::filesystem::path m_path;
    };

    auto path_guard =
        Path_Guard{ std::filesystem::temp_directory_path() / "temp.txt" };

    auto out_file = std::ofstream{ path_guard.get_path(),
        std::ios::out | std::ios::trunc };

    ASSERT_TRUE(out_file.is_open() == true);
    out_file << "Hello!\n";
    out_file.close();
    ASSERT_TRUE(out_file.is_open() == false);

    ASSERT_TRUE(std::filesystem::exists(path_guard.get_path()) == true);

    auto in_file = std::ifstream{ path_guard.get_path(), std::ios::in };
    ASSERT_TRUE(in_file.is_open() == true);

    auto str = std::string{};
    in_file >> str;
    in_file.close();
    ASSERT_TRUE(in_file.is_open() == false);

    EXPECT_TRUE(str == "Hello!");
}
