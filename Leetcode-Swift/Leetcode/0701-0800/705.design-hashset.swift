//
//  705.design-hashset.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/25.
//

import Foundation

/*
 705. 设计哈希集合 (简单)
 https://leetcode-cn.com/problems/design-hashset/
 */

class Solution_705 {
    class MyHashSet {

        var base: Int
        var data: [[Int]]
        /** Initialize your data structure here. */
        init() {
            base = 100
            data = [[Int]](repeating: [Int](), count: base)
        }
        
        func add(_ key: Int) {
            let index = hash(key)
            let values = data[index]
            for i in values {
                if i == key {
                    return
                }
            }
            data[index].append(key)
        }
        
        func remove(_ key: Int) {
            let keyIndex = hash(key)
            for (index, i) in data[keyIndex].enumerated() {
                if i == key {
                    data[keyIndex].remove(at: index)
                    return
                }
            }
        }
        
        /** Returns true if this set contains the specified element */
        func contains(_ key: Int) -> Bool {
            for i in data[hash(key)] {
                if i == key {
                    return true
                }
            }
            return false
        }
        
        func hash(_ key: Int) -> Int {
            return key % base
        }
    }
    
    func test() {
        let obj = MyHashSet()
        obj.add(1)
        obj.add(2)
        print(obj.contains(1))
        obj.remove(1)
        print(obj.contains(1))
    }
}
