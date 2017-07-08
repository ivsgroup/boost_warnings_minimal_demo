#include <string>
#include <iostream>
#include <boost/optional/optional.hpp>

int main(int argc, char **argv)
{
  boost::optional<std::string> name;
  if (argc > 1)
    name.reset(argv[1]);

  if (name.is_initialized())
    std::cout << "Hello, " << name.get() << "\n";
  else
    std::cout << "Hello, world \n";
  return 0;
}