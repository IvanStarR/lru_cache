application(NAME MyApplication 
            TYPE executable
            DEPENDENCIES LRUCache.LRUCache 
                         Catch2::Catch2WithMain)

add_test(NAME LRUCacheTest COMMAND LRUCacheTest)




