# Creates static or shared library or an exacutable binary from files of current directory with .cpp, .h, h++, .c, .cc, .hxx, .cxx extensions
# NAME -- name of application
# TYPE -- type of application. possible values are static, shared, executable
# DEPENDENCIES -- list of deps of the app

macro(application NAME)

    set(DEPS ${ARGN})

   
    file(GLOB_RECURSE FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.c ${CMAKE_CURRENT_SOURCE_DIR}/*.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.h ${CMAKE_CURRENT_SOURCE_DIR}/*.h++
        ${CMAKE_CURRENT_SOURCE_DIR}/*.hxx
    )

   
    add_executable(${NAME} ${FILES})

    target_include_directories(${NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../include)

    foreach(DEP ${DEPS})
        target_link_libraries(${NAME} PUBLIC ${DEP})
    endforeach()
endmacro()


# Creates static or shared libraryfrom files of current directory with .cpp, .h, h++, .c, .cc, .hxx, .cxx extensions
# NAME -- name of a module
# TYPE -- type of a module. possible values are static, shared
# DEPENDENCIES -- list of deps of the module

macro(module NAME TYPE) 

    set(DEPS ${ARGN})

    file(GLOB_RECURSE MODULE_SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.c ${CMAKE_CURRENT_SOURCE_DIR}/*.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cxx ${CMAKE_CURRENT_SOURCE_DIR}/*.h ${CMAKE_CURRENT_SOURCE_DIR}/*.h++
        ${CMAKE_CURRENT_SOURCE_DIR}/*.hxx
    )

    add_library(${NAME} ${TYPE} ${MODULE_SOURCES})

    target_include_directories(${NAME} PUBLIC $${CMAKE_CURRENT_SOURCE_DIR}/../../include)

    foreach(DEP ${DEPS})
    target_link_libraries(${NAME} PUBLIC ${DEP})
    endforeach()

endmacro()

