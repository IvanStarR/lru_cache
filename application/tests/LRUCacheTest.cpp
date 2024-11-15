#define CATCH_CONFIG_MAIN
#include <catch2/catch_all.hpp>
#include "../../include/lru_cache.hpp"
#include <iostream>
#include "dir_example/dir.hpp"
TEST_CASE("LRUCache<int, std::string>", "[LRUCache]") {
    auto cache = LRUCache<int, std::string>::Create(2);
    REQUIRE(cache != nullptr);
    
    SECTION("Inserting and retrieving elements") {
        cache->put(1, "one");
        cache->put(2, "two");
        INFO("1");
        REQUIRE(cache->get(1).has_value());
        REQUIRE(cache->get(1).value() == "one");
        REQUIRE(cache->get(2).has_value());
        REQUIRE(cache->get(2).value() == "two");
        Test();
        cache->Test2();
    }

    SECTION("Eviction of least recently used element") {
        cache->put(1, "one");
        cache->put(2, "two");
        cache->put(3, "three"); 
        INFO("2");
       // std::cout <<"test 32423423 \n";
        REQUIRE(!cache->get(1).has_value());
        REQUIRE(cache->get(2).has_value());
        REQUIRE(cache->get(3).has_value());
    }
}

TEST_CASE("LRUCache<std::string, int>", "[LRUCache]") {
    auto cache = LRUCache<std::string, int>::Create(2);
    REQUIRE(cache != nullptr);

    SECTION("Inserting and retrieving elements") {
        cache->put("one", 1);
        cache->put("two", 2);

        REQUIRE(cache->get("one").has_value());
        REQUIRE(cache->get("one").value() == 1);
        REQUIRE(cache->get("two").has_value());
        REQUIRE(cache->get("two").value() == 2);
    }

    SECTION("Eviction of least recently used element") {
        cache->put("one", 1);
        cache->put("two", 2);
        cache->put("three", 3); 

        REQUIRE(!cache->get("one").has_value());
        REQUIRE(cache->get("two").has_value());
        REQUIRE(cache->get("three").has_value());
    }
}