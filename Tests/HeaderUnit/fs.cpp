import <fs.hpp>;

int main([[maybe_unused]] int argc, [[maybe_unused]] char* argv[])
{
    auto out_file = std::ofstream{
        std::filesystem::temp_directory_path() / "temp.txt",
        std::ios::out | std::ios::trunc };
    if (out_file.is_open() == false)
    {
        return 1;
    }

    out_file << "Hello!\n";
    out_file.close();
    if (out_file.is_open() == true)
    {
        return 2;
    }
    if (std::filesystem::exists(
        std::filesystem::temp_directory_path() / "temp.txt") == false)
    {
        return 3;
    }

    auto in_file = std::ifstream{
        std::filesystem::temp_directory_path() / "temp.txt",
        std::ios::in };
    if (in_file.is_open() == false)
    {
        return 4;
    }

    auto str = std::string{};
    in_file >> str;
    in_file.close();
    if (in_file.is_open() == true)
    {
        return 5;
    }
    if (str != "Hello!")
    {
        return 6;
    }

    return 0;
}
