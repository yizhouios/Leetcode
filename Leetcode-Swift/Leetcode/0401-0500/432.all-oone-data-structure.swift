//
//  432.all-oone-data-structure.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/1.
//

import Foundation

/*
 432. 全 O(1) 的数据结构 (困难)
 https://leetcode-cn.com/problems/all-oone-data-structure/
 */

class Solution_432 {
    class AllOne {
        
        class DLinkedNode {
            var val: Int
            var keys: [String: Bool] = [:]
            var next: DLinkedNode?
            var pre: DLinkedNode?
            init(_ val: Int) {
                self.val = val
            }
        }
        
        var keyToValDict = [String : Int]()
        var valToNodeDict = [Int : DLinkedNode]()
        var linkList: DLinkedNode?
        var head: DLinkedNode
        var tail: DLinkedNode
        /** Initialize your data structure here. */
        init() {
            head = DLinkedNode(0)
            tail = DLinkedNode(0)
            head.next = tail
            tail.pre = head
        }
        
        /** Inserts a new key <Key> with value 1. Or increments an existing key by 1. */
        func inc(_ key: String) {
            if keyToValDict[key] == nil { // 如果是新的key
                keyToValDict[key] = 1
                var node = valToNodeDict[1]
                if node == nil {
                    node = DLinkedNode(1)
                    node?.next = tail
                    node?.pre = tail.pre
                    tail.pre?.next = node
                    tail.pre = node
                    
                    node?.keys[key] = true
                    valToNodeDict[1] = node
                } else {
                    node?.keys[key] = true
                }
            } else { // 已经存在的key
                let val = keyToValDict[key]!
                let newVal = val + 1
                keyToValDict[key]! = newVal
                // 从旧的值对应的节点中，移除当前key
                let oldNode = valToNodeDict[val]!
                var preNode = oldNode.pre!
                oldNode.keys[key] = nil
                // 将新的值对应的key加到新值对应的节点的keys中
                if preNode === head  || preNode.val > newVal {
                    let newNode = DLinkedNode(newVal)
                    newNode.keys[key] = true
                    newNode.next = oldNode
                    newNode.pre = preNode
                    preNode.next = newNode
                    oldNode.pre = newNode
                    valToNodeDict[newVal] = newNode
                    preNode = newNode
                } else {
                    preNode.keys[key] = true
                }
                if oldNode.keys.isEmpty {
                    preNode.next = oldNode.next
                    oldNode.next?.pre = preNode
                    valToNodeDict[val] = nil
                }
            }
        }
        
        /** Decrements an existing key by 1. If Key's value is 1, remove it from the data structure. */
        func dec(_ key: String) {
            if keyToValDict[key] == nil {
                return
            }
            let oldVal = keyToValDict[key]!
            let node = valToNodeDict[oldVal]!
            node.keys[key] = nil
            
            if oldVal == 1 {
                keyToValDict[key] = nil
            } else {
                let newVal = oldVal - 1
                keyToValDict[key] = newVal
                
                let nextNode = node.next!
                if nextNode === tail || nextNode.val < newVal {
                    let newNode = DLinkedNode(newVal)
                    newNode.keys[key] = true
                    
                    newNode.next = nextNode
                    newNode.pre = node
                    nextNode.pre = newNode
                    node.next = newNode
                    
                    valToNodeDict[newVal] = newNode
                } else {
                    nextNode.keys[key] = true
                }
            }
            
            if node.keys.isEmpty {
                node.pre?.next = node.next;
                node.next?.pre = node.pre;
                valToNodeDict[oldVal] = nil
            }
        }
        
        
        /** Returns one of the keys with maximal value. */
        func getMaxKey() -> String {
            let node = head.next
            if node === tail {
                return ""
            }
            return node?.keys.keys.first ?? ""
        }
        
        /** Returns one of the keys with Minimal value. */
        func getMinKey() -> String {
            let node = tail.pre
            if node === head {
                return ""
            }
            return node?.keys.keys.first ?? ""
        }
        
        // O(nlogn)解法（超时）
//        /** Returns one of the keys with maximal value. */
//        func getMaxKey() -> String {
//            var maxKey = ""
//            var maxValue = 0
//            for (key, value) in dict {
//                if value >= maxValue {
//                    maxKey = key
//                    maxValue = value
//                }
//            }
//            return maxKey
//        }
//
//        /** Returns one of the keys with Minimal value. */
//        func getMinKey() -> String {
//            var minKey = ""
//            var minValue = -1
//            for (key, value) in dict {
//                if minValue == -1 || value <= minValue {
//                    minKey = key
//                    minValue = value
//                }
//            }
//            return minKey
//        }
    }

    /**
     * Your AllOne object will be instantiated and called as such:
     * let obj = AllOne()
     * obj.inc(key)
     * obj.dec(key)
     * let ret_3: String = obj.getMaxKey()
     * let ret_4: String = obj.getMinKey()
     */
    func test() {
        let obj = AllOne()
        obj.inc("a")
        obj.inc("a")
        obj.inc("a")
        obj.inc("b")
        obj.inc("b")
        print(obj.getMaxKey())
        print(obj.getMinKey())
        obj.dec("b")
        obj.dec("b")
        print(obj.getMaxKey())
        print(obj.getMinKey())
    }
}
