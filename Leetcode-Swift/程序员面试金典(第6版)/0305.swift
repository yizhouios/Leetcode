//
//  0305.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/15.
//

import Foundation

/*
 面试题 03.05. 栈排序 (中等)
 https://leetcode-cn.com/problems/sort-of-stacks-lcci/
 */

class Solution_Jindian_0305 {
    class SortedStack {
        var stack = [Int]()
        
        init() {

        }
        
        func push(_ val: Int) {
            self.stack.append(val)
        }
        
        func pop() {
            if self.isEmpty() {
                return
            }
            
            self.sortForMin()
            self.stack.removeLast()
        }
        
        func peek() -> Int {
            if self.isEmpty() {
                return -1
            }
            
            self.sortForMin()
            return self.stack.last!
        }
        
        func isEmpty() -> Bool {
            return self.stack.isEmpty
        }
        
        func sortForMin() {
            if self.isEmpty() {
                return
            }
            
            var min = self.stack.removeLast()
            var tmp = [Int]()
            while !self.stack.isEmpty {
                let value = self.stack.removeLast()
                if min > value {
                    tmp.append(min)
                    min = value
                } else {
                    tmp.append(value)
                }
            }
            while !tmp.isEmpty {
                self.stack.append(tmp.removeLast())
            }
            self.stack.append(min)
        }
    }

}
