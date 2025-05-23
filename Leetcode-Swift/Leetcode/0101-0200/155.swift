//
//  155.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/15.
//

import Foundation

/*
 155. 最小栈 (简单)
 https://leetcode-cn.com/problems/min-stack/
 */

class Solution_155 {
    class MinStack {

        var stack = [Int]()
        var minStack = [Int]()

        init() {

        }
        
        func push(_ val: Int) {
            self.stack.append(val)

            // 每次压入最新的最小的值
            if self.minStack.isEmpty {
                self.minStack.append(val)
            } else {
                let min = self.getMin()
                self.minStack.append(min > val ? val : min)
            }
        }
        
        func pop() {
            self.stack.removeLast()
            self.minStack.removeLast()
        }
        
        func top() -> Int {
            return self.stack.last ?? -1
        }
        
        func getMin() -> Int {
            return self.minStack.last ?? -1
        }
    }
}
