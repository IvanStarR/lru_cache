application(NAME MyApplication 
            TYPE executable
            DEPENDENCIES LRUCache 
                         Catch2::Catch2WithMain)

add_test(NAME LRUCacheTest COMMAND LRUCacheTest)




