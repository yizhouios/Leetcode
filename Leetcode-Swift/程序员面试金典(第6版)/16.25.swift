//
//  16.25.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/15.
//

import Foundation

/*
 面试题 16.25. LRU 缓存 (中等)
 https://leetcode-cn.com/problems/lru-cache-lcci/
 */

class Solution_Jindian_16_25 {
    class LRUCache {
        
        class ListNode {
            var val: Int
            var key: Int
            var pre: ListNode?
            var next: ListNode?
            init(_ key: Int, _ val: Int) {
                self.key = key
                self.val = val
            }
        }

        var capacity: Int
        var count: Int = 0
        var head: ListNode?
        var tail: ListNode?
        var dict = [Int: ListNode]()
        
        init(_ capacity: Int) {
            self.capacity = capacity
        }
        
        func get(_ key: Int) -> Int {
            if head == nil {
                return -1
            }
            
            if let node = dict[key] {
                if head === node {
                    if tail === node {
                        return head!.val
                    } else {
                        head?.next?.pre = nil
                        head = head?.next
                    }
                } else if tail === node {
                    return tail!.val
                } else {
                    node.next?.pre = node.pre
                    node.pre?.next = node.next
                }
                
                node.pre = tail
                node.next = nil
                tail?.next = node
                tail = node
                
                return node.val
            }
            
            return -1
        }
        
        func put(_ key: Int, _ value: Int) {
            if let _ = dict[key] {
                let _ = get(key)
                tail?.val = value
            } else {
                if count == capacity {
                    dict[head!.key] = nil
                    if head === tail {
                        head = nil
                        tail = nil
                    } else {
                        head?.next?.pre = nil
                        head = head?.next
                    }
                    count -= 1
                }
                
                let newTail = ListNode(key, value)
                dict[key] = newTail
                if tail == nil {
                    head = newTail
                    tail = newTail
                } else {
                    tail?.next = newTail
                    newTail.pre = tail
                    tail = newTail
                }
                
                count += 1
            }
        }
    }

    /**
     * Your LRUCache object will be instantiated and called as such:
     * let obj = LRUCache(capacity)
     * let ret_1: Int = obj.get(key)
     * obj.put(key, value)
     */
    
    func test() {
        let cache = LRUCache(1)

        cache.put(1, 1);
        print(cache.get(1))       // 返回  1
        cache.put(2, 2);
        print(cache.get(2))       // 返回 -1 (未找到)
        print(cache.get(3))       // 返回 -1 (未找到)

//        cache.put(3, 3)    // 该操作会使得密钥 2 作废
//        cache.put(4, 4)    // 该操作会使得密钥 1 作废
//        print(cache.get(1))       // 返回 -1 (未找到)
//        print(cache.get(3))       // 返回  3
//        print(cache.get(4))       // 返回  4
    }
}
