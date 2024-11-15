application(NAME MyApplication 
            TYPE exectable
            DEPENDENCIES LRUCache 
                         Catch2::Catch2WithMain)

add_test(NAME LRUCacheTest COMMAND LRUCacheTest)




