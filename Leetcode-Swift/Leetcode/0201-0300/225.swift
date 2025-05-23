//
//  225.implement-stack-using-queues.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/4.
//

import Foundation
/*
 225. 用队列实现栈 (简单)
 https://leetcode-cn.com/problems/implement-stack-using-queues/
 */

class MyStack {

    var queue1 = [Int]()
    var queue2 = [Int]()
    
    init() {}
    
    func push(_ x: Int) {
        self.queue1.append(x)
    }
    
    func pop() -> Int {
        while self.queue1.count > 1 {
            self.queue2.append(self.queue1.removeFirst())
        }
        if !self.queue1.isEmpty {
            let value = self.queue1.removeFirst()
            swap(&self.queue1, &self.queue2)
            return value
        }
        return -1
    }
    
    func top() -> Int {
        while self.queue1.count > 1 {
            self.queue2.append(self.queue1.removeFirst())
        }
        return self.queue1.first ?? -1
    }
    
    func empty() -> Bool {
        return self.queue1.isEmpty && self.queue2.isEmpty
    }
}

class MyStack2 {
    var queue1: MyQueue232 = MyQueue232()
    var queue2: MyQueue232 = MyQueue232()
    
    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue1.push(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        while queue1.size() > 1 {
            queue2.push(queue1.pop())
        }
        let topValue = queue1.pop()
        swap(&queue1, &queue2)
        return topValue
    }
    
    /** Get the top element. */
    func top() -> Int {
        while queue1.size() > 1 {
            queue2.push(queue1.pop())
        }
        return queue1.peek()
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue1.size() == 0 && queue2.size() == 0
    }
}

class Solution225 {
    func test() {
        let obj = MyStack2()
        obj.push(1)
        let ret_2: Int = obj.pop()
        obj.push(2)
        let ret_3: Int = obj.top()
        let ret_4: Int = obj.pop()
        let ret_5: Bool = obj.empty()
        print(ret_2, ret_3, ret_4, ret_5)
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
