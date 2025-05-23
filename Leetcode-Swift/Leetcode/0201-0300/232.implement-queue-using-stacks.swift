//
//  232.implement-queue-using-stacks.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/4.
//

import Foundation
/*
 232. 用栈实现队列 (简单)
 https://leetcode-cn.com/problems/implement-queue-using-stacks/
 */

class MyQueue232 {
    var inputStack: [Int] = []
    var outputStack: [Int] = []
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        inputStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if outputStack.count == 0 {
            while inputStack.count > 0 {
                outputStack.append(inputStack.popLast() ?? 0)
            }
        }
        return outputStack.popLast() ?? 0
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if outputStack.count == 0 {
            while inputStack.count > 0 {
                outputStack.append(inputStack.popLast() ?? 0)
            }
        }
        return outputStack.last ?? 0
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return inputStack.count == 0 && outputStack.count == 0
    }
    
    func size() -> Int {
        return inputStack.count + outputStack.count
    }
}

class Solution_232 {
    func test() {
        let obj = MyQueue232()
        obj.push(1)
        let ret_2: Int = obj.pop()
        obj.push(2)
        let ret_3: Int = obj.peek()
        let ret_4: Int = obj.pop()
        let ret_5: Bool = obj.empty()
        print(ret_2, ret_3, ret_4, ret_5)
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
