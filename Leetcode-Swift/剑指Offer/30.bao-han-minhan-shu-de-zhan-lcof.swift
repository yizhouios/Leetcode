//
//  30.bao-han-minhan-shu-de-zhan-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/9.
//

import Foundation

/*
 剑指 Offer 30. 包含min函数的栈 (简单)
 https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof/
 */

class Solution_Offer_30 {
    class MinStack {
        var stack = [Int]()
        var minRecords = [Int]()
        var minValue = 0

        /** initialize your data structure here. */
        init() {

        }
        
        func push(_ x: Int) {
            stack.append(x)
            if minRecords.count > 0 {
                minValue = Swift.min(x, minValue)
            } else {
                minValue = x
            }
            minRecords.append(minValue)
        }
        
        func pop() {
            stack.removeLast()
            minRecords.removeLast()
            if minRecords.count > 0 {
                minValue = minRecords.last!
            }
        }
        
        func top() -> Int {
            return stack.last!
        }
        
        func min() -> Int {
            return minValue
        }
    }

    /**
     * Your MinStack object will be instantiated and called as such:
     * let obj = MinStack()
     * obj.push(x)
     * obj.pop()
     * let ret_3: Int = obj.top()
     * let ret_4: Int = obj.min()
     */
    
    /*
     测试用例：
     1. 新压入栈的数字比之前的最小值大
     2. 新压入栈的数字比之前的最小值小
     3. 弹出栈的数字不是最小元素
     4. 弹出栈的数字是最小元素
     */
    func test() {
        let obj = MinStack()
        obj.push(-2)
        obj.push(0)
        obj.push(-3)
        print(obj.min())
        obj.pop()
        print(obj.top())
        print(obj.min())
    }
}
