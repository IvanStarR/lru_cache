#ifndef LRU_CACHE_HPP 
#define LRU_CACHE_HPP 
 
#include <unordered_map> 
#include <list> 
#include <optional> 
#include <memory> 
#include <string> 
 
template <typename Key, typename Value> 
class LRUCache { 
private:
    explicit LRUCache(size_t capacity) : capacity_(capacity) {} 
public: 
   

    static std::unique_ptr<LRUCache<Key, Value>> Create(size_t capacity) noexcept{ 
        if (capacity == 0) { 
            return nullptr; 
        } 
        return std::unique_ptr<LRUCache<Key, Value>>(new LRUCache<Key, Value>(capacity));
    } 
 
   
    void put(const Key& key, const Value& value) noexcept{ 
        auto it = cache_map_.find(key); 
        if (it != cache_map_.end()) { 
            cache_list_.erase(it->second); 
        } 
 
        cache_list_.emplace_front(key, value); 
      //  cache_map_[key] = cache_list_.begin(); 
        cache_map_.emplace(key, cache_list_.begin());
 
        if (cache_list_.size() > capacity_) { 
            auto last = cache_list_.end(); 
            --last; 
            cache_map_.erase(last->first); 
            cache_list_.pop_back(); 
        } 
    } 
 
    
    std::optional<Value> get(const Key& key) noexcept{ 
        auto it = cache_map_.find(key); 
        if (it == cache_map_.end()) { 
            return std::nullopt; 
        } 
 
         
        cache_list_.splice(cache_list_.begin(), cache_list_, it->second); 
        return it->second->second; 
    } 

    //delete 
    void Test2();
 
private: 
    size_t capacity_; 
    std::list<std::pair<Key, Value>> cache_list_; 
    std::unordered_map<Key, typename std::list<std::pair<Key, Value>>::iterator> cache_map_; 
}; 
 

template class LRUCache<int, std::string>; 
template class LRUCache<std::string, int>; 
 
#endif 