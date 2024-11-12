#include <iostream>
#include <string>
#include "../../include/lru_cache.hpp"


int main () {
    auto cache = LRUCache<int, std::string>::Create(2);
    cache->put(1, "A");
    auto value = cache->get(1);
    std::cout << *value << std::endl;
    return 0;
}
