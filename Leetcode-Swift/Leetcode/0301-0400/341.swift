//
//  341.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/26.
//

import Foundation

/*
 341. 扁平化嵌套列表迭代器 (中等)
 https://leetcode-cn.com/problems/flatten-nested-list-iterator/
 */

class Solution_341 {
    
  // This is the interface that allows for creating nested lists.
  // You should not implement it, or speculate about its implementation
    class NestedInteger {
        var p_isInteger = false
        var integer: Int = 0
        var list: [NestedInteger] = Array()
        
        // Return true if this NestedInteger holds a single integer, rather than a nested list.
        public func isInteger() -> Bool {
            return p_isInteger
        }
    
        // Return the single integer that this NestedInteger holds, if it holds a single integer
        // The result is undefined if this NestedInteger holds a nested list
        func getInteger() -> Int {
            return integer
        }
    
        // Set this NestedInteger to hold a single integer.
        public func setInteger(value: Int) {
            integer = value
            p_isInteger = true
        }
    
        // Set this NestedInteger to hold a nested list and adds a nested integer to it.
        public func add(elem: NestedInteger) {
            list.append(elem)
        }
    
        // Return the nested list that this NestedInteger holds, if it holds a nested list
        // The result is undefined if this NestedInteger holds a single integer
        public func getList() -> [NestedInteger] {
            return list
        }
    }
    

    class NestedIterator {
        var stack = [NestedInteger]()
        init(_ nestedList: [NestedInteger]) {
            for i in nestedList.reversed() {
                stack.append(i)
            }
        }
        
        func next() -> Int {
            return stack.removeLast().getInteger()
        }
        
        func hasNext() -> Bool {
            while !stack.isEmpty {
                let top = stack.last!
                if top.isInteger() {
                    return true
                }
                let list = stack.removeLast().getList()
                for i in stride(from: list.count - 1, to: -1, by: -1) {
                    stack.append(list[i])
                }
            }
            return false
        }
    }

    /**
     * Your NestedIterator object will be instantiated and called as such:
     * let obj = NestedIterator(nestedList)
     * let ret_1: Int = obj.next()
     * let ret_2: Bool = obj.hasNext()
     */
    
    func test() {
        let n1 = NestedInteger()
        n1.setInteger(value: 1)
        let n2 = NestedInteger()
        n2.setInteger(value: 3)
        let n3 = NestedInteger()
        n3.setInteger(value: 2)
        
        let n0 = NestedInteger()
        n0.add(elem: n1)
        n0.add(elem: n2)
        
        let obj = NestedIterator([n0, n3])
        print(obj.hasNext())
        print(obj.next())
        print(obj.hasNext())
        print(obj.next())
        print(obj.hasNext())
        print(obj.next())
        print(obj.hasNext())
    }
}
