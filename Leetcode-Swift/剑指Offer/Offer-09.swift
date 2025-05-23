//
//  09.yong-liang-ge-zhan-shi-xian-dui-lie-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/26.
//

import Foundation

/*
 剑指 Offer 09. 用两个栈实现队列 (简单)
 https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/
 */

class Solution_Offer_09 {
    class CQueue {
        var inputStack: [Int] = []
        var outputStack: [Int] = []
        
        /** Initialize your data structure here. */
        init() {
            
        }
        
        func appendTail(_ value: Int) {
            inputStack.append(value)
        }
        
        func deleteHead() -> Int {
            if outputStack.isEmpty {
                while !inputStack.isEmpty {
                    outputStack.append(inputStack.popLast()!)
                }
            }
            return outputStack.popLast() ?? -1
        }
    }

    /**
     * Your CQueue object will be instantiated and called as such:
     * let obj = CQueue()
     * obj.appendTail(value)
     * let ret_2: Int = obj.deleteHead()
     */
    
    /*
     测试用例：
     1. 往空的队列里添加、删除元素
     2. 往非空的队列里添加、删除元素
     3. 连续删除元素直至队列为空
     */
    func test() {
        let obj = CQueue()
        obj.appendTail(1)
        obj.appendTail(2)
        print(obj.deleteHead())
        obj.appendTail(3)
        print(obj.deleteHead())
        print(obj.deleteHead())
    }
}
