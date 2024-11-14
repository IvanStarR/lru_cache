
if (Catch2_FOUND)
    get_target_property(CATCH2_INCLUDE_DIRS Catch2::Catch2 INTERFACE_INCLUDE_DIRECTORIES)
    set(CATCH2_LIBRARIES Catch2::Catch2WithMain)
  
else()
    message(FATAL_ERROR "Catch2 dont found!")
endif()





#CATCH2_INCLUDE_DIRS

#CATCH2_LIBRARIES
