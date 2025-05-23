//
//  146.lru-cache.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/23.
//

import Foundation

/*
 146. LRU 缓存机制 (中等)
 https://leetcode-cn.com/problems/lru-cache/
 */

class Solution146 {
    class LRUCache {
        class DLinkNode {
            var key: Int
            var value: Int
            var prev: DLinkNode?
            var next: DLinkNode?

            init(_ key: Int, _ value: Int) {
                self.key = key
                self.value = value
            }
        }

        var size: Int = 0
        let capacity: Int
        var map = [Int: DLinkNode?]()

        // 虚拟头节点
        let head: DLinkNode?
        var tail: DLinkNode?

        init(_ capacity: Int) {
            self.capacity = capacity
            self.head = DLinkNode(0, 0)
            self.tail = DLinkNode(0, 0)
            self.head?.next = self.tail
            self.tail?.prev = self.head
        }
        
        func get(_ key: Int) -> Int {
            if let node = map[key] {
                removeNode(node)
                addNode(node)

                return node!.value
            }
            return -1
        }
        
        func put(_ key: Int, _ value: Int) {
            // 之前存在
            if let node = map[key] {
                // 更新值
                node!.value = value
                
                // 放到最新被访问的位置
                removeNode(node)
                addNode(node)
                return
            }

            // 如果满了，就先删除一个
            if self.size == self.capacity {
                removeNode(self.tail?.prev)
            }

            // 插入新的
            let node: DLinkNode? = DLinkNode(key, value)
            addNode(node)
        }

        func removeNode(_ node: DLinkNode?) {
            if node == nil {
                return
            }
            node?.next?.prev = node?.prev
            node?.prev?.next = node?.next

            self.map[node!.key] = nil
            self.size -= 1
        }
        
        // 头插法（保持LRU头部是最新被访问的数据）
        func addNode(_ node: DLinkNode?) {
            if node == nil {
                return
            }

            node?.next = self.head?.next
            node?.prev = self.head
            node?.next?.prev = node
            node?.prev?.next = node

            self.map[node!.key] = node
            self.size += 1
        }
    }

    /**
     * Your LRUCache object will be instantiated and called as such:
     * let obj = LRUCache(capacity)
     * let ret_1: Int = obj.get(key)
     * obj.put(key, value)
     */
    
    /*
     测试用例：
     1.
     */
    func test() {
        let obj = LRUCache(2)
        obj.put(1, 1)
        obj.put(2, 2)
        print(obj.get(1))
        obj.put(3, 3)
        print(obj.get(2))
        obj.put(4, 4)
        print(obj.get(1))
        print(obj.get(3))
        print(obj.get(4))
    }
}
