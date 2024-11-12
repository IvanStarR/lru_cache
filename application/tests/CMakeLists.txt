include(FetchContent)
FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG v3.4.0
)
FetchContent_MakeAvailable(Catch2)

add_executable(LRUCacheTest LRUCacheTest.cpp)
target_include_directories(LRUCacheTest PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(LRUCacheTest PRIVATE Catch2::Catch2WithMain)

#application(
#    NAME MyApplication
#    DEPENDENCIES LRUCache Catch2::Catch2WithMain
#)

add_test(NAME LRUCacheTest COMMAND LRUCacheTest)
