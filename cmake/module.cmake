# Creates static or shared library from files of current directory with .cpp, .h, .c, .cc, .hxx, .cxx extensions
# NAME -- name of a module
# TYPE -- type of a module. possible values are static, shared
# DEPENDENCIES -- list of deps of the module

macro(module)
    cmake_parse_arguments(MODULE "" "NAME;TYPE" "DEPENDENCIES" ${ARGN})

    if(NOT MODULE_NAME OR NOT MODULE_TYPE)
        message(FATAL_ERROR "module macro requires NAME and TYPE arguments")
    endif()

    file(GLOB_RECURSE MODULE_SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.c ${CMAKE_CURRENT_SOURCE_DIR}/*.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.h ${CMAKE_CURRENT_SOURCE_DIR}/*.h++
        ${CMAKE_CURRENT_SOURCE_DIR}/*.hxx
    )

    add_library(${MODULE_NAME} ${MODULE_TYPE} ${MODULE_SOURCES})

    target_include_directories(${MODULE_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../include)

    if(MODULE_DEPENDENCIES)
        foreach(DEP ${MODULE_DEPENDENCIES})
            target_link_libraries(${MODULE_NAME} PUBLIC ${DEP})
        endforeach()
    endif()
endmacro()

# Creates static or shared library or an executable binary from files of current directory with .cpp, .h, .c, .cc, .hxx, .cxx extensions
# NAME -- name of application
# TYPE -- type of application. possible values are static, shared, executable
# DEPENDENCIES -- list of deps of the app

macro(application)
    cmake_parse_arguments(APP "" "NAME;TYPE" "DEPENDENCIES" ${ARGN})

    if(NOT APP_NAME OR NOT APP_TYPE)
        message(FATAL_ERROR "application macro requires NAME and TYPE arguments")
    endif()

    file(GLOB_RECURSE APP_SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.c ${CMAKE_CURRENT_SOURCE_DIR}/*.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.h ${CMAKE_CURRENT_SOURCE_DIR}/*.h++
        ${CMAKE_CURRENT_SOURCE_DIR}/*.hxx
    )

    add_executable(${APP_NAME} ${APP_SOURCES})

    target_include_directories(${APP_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../include)

    if(APP_DEPENDENCIES)
        foreach(DEP ${APP_DEPENDENCIES})
            target_link_libraries(${APP_NAME} PUBLIC ${DEP})
        endforeach()
    endif()
endmacro()
