cmake_minimum_required(VERSION 3.28)
project(LRUCache)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include(cmake/module.cmake)


find_package(Catch2 REQUIRED)

include_directories(
    ${CATCH2_INCLUDE_DIRS}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_subdirectory(source)
add_subdirectory(application)

enable_testing()




#add_library(LRUCache STATIC include/lru_cache.hpp source/lru_cache.cpp)
#target_include_directories(LRUCache PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)









#add_executable(Application application/main.cpp)
#target_include_directories(Application PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
#target_link_libraries(Application PRIVATE LRUCache)

#include(FetchContent)
#FetchContent_Declare(
#    Catch2
#    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
#    GIT_TAG v3.4.0
#)
#FetchContent_MakeAvailable(Catch2)

#enable_testing()
#add_executable(LRUCacheTest tests/LRUCacheTest.cpp)
#target_include_directories(LRUCacheTest PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

#target_link_libraries(LRUCacheTest PRIVATE Catch2::Catch2WithMain)
#add_test(NAME LRUCacheTest COMMAND LRUCacheTest)

