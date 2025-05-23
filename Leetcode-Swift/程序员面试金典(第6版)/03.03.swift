//
//  03.03.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/17.
//

import Foundation

/*
 面试题 03.03. 堆盘子 (中等)
 https://leetcode-cn.com/problems/stack-of-plates-lcci/
 */

class Solution_Jindian_03_03 {
    class StackOfPlates {
        var cap = 0
        var stacks = [[Int]]()
        
        init(_ cap: Int) {
            self.cap = cap
        }
        
        func push(_ val: Int) {
            if cap == 0 {
                return
            }
            if stacks.isEmpty || stacks.last!.count == cap {
                stacks.append([Int]())
            }
//            stacks.last.append
            var lastStack = stacks.last!
            lastStack.append(val)
            stacks[stacks.count - 1] = lastStack
        }
        
        func pop() -> Int {
            if stacks.isEmpty {
                return -1
            }
            var lastStack = stacks.last!
            let popVal = lastStack.removeLast()
            if lastStack.isEmpty {
                stacks.removeLast()
            } else {
                stacks[stacks.count - 1] = lastStack
            }
            return popVal
        }
        
        func popAt(_ index: Int) -> Int {
            if index < 0 || index >= stacks.count {
                return -1
            }
            var stack = stacks[index]
            let val = stack.removeLast()
            if stack.isEmpty {
                stacks.remove(at: index)
            } else {
                stacks[index] = stack
            }
            return val
        }
    }

    /**
     * Your StackOfPlates object will be instantiated and called as such:
     * let obj = StackOfPlates(cap)
     * obj.push(val)
     * let ret_2: Int = obj.pop()
     * let ret_3: Int = obj.popAt(index)
     */
    
    func test() {
        let obj = StackOfPlates(2)
        obj.push(1)
        obj.push(2)
        obj.push(3)
        obj.push(4)
        obj.push(5)
        print(obj.pop())
        print(obj.popAt(0))
        print(obj.popAt(1))
        print(obj.pop())
        print(obj.pop())
        print(obj.pop())
    }
}
