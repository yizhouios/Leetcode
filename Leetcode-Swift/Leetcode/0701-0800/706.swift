//
//  706.design-hashmap.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/3.
//

import Foundation

/*
 706. 设计哈希映射 (简单)
 https://leetcode-cn.com/problems/design-hashmap/
 */

class Solution_706 {
    class MyHashMap {
        class LinkNode {
            var val: Int
            var key: Int
            var next: LinkNode?
            init(_ key: Int, _ val: Int) {
                self.key = key
                self.val = val
            }
        }
            
        static let capacity: Int = 100
        var data: [LinkNode] = [LinkNode](repeating: LinkNode(0, 0), count: MyHashMap.capacity)
        
        /** Initialize your data structure here. */
        init() {
            
        }

        func hash(_ key: Int) -> Int {
            return key % MyHashMap.capacity
        }
        
        /** value will always be non-negative. */
        func put(_ key: Int, _ value: Int) {
            let index = hash(key)
            let virtualHead = data[index]
            
            // 删除之前的key
            remove(key)

            // 插入新的key（头插法）
            let node = LinkNode(key, value)
            node.next = virtualHead.next
            virtualHead.next = node
        }
        
        /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
        func get(_ key: Int) -> Int {
            let index = hash(key)
            let virtualHead = data[index]

            var node = virtualHead.next
            while node != nil {
                if node!.key == key {
                    return node!.val
                }
                node = node?.next
            }
            return -1
        }
        
        /** Removes the mapping of the specified value key if this map contains a mapping for the key */
        func remove(_ key: Int) {
            let index = hash(key)
            let virtualHead = data[index]

            var pre: LinkNode? = virtualHead
            var cur = virtualHead.next
            while cur != nil {
                if cur!.key == key {
                    pre?.next = cur?.next
                    return
                }

                pre = cur
                cur = cur?.next
            }
        }
    }

    func test() {
        print("fda")
        
        
        /**
         * Your MyHashMap object will be instantiated and called as such:
         * let obj = MyHashMap()
         * obj.put(key, value)
         * let ret_2: Int = obj.get(key)
         * obj.remove(key)
         */
    }
}
