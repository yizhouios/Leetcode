//
//  03.01.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/15.
//

import Foundation

/*
 面试题 03.01. 三合一 (简单)
 https://leetcode-cn.com/problems/three-in-one-lcci/
 */

class Solution_Jindian_0301 {
    class TripleInOne {

        var stackCount = 3
        var stackSize: Int
        var stackLength: [Int]
        var stack: [Int]

        init(_ stackSize: Int) {
            self.stackSize = stackSize
            self.stack = [Int](repeating: 0, count: self.stackCount * stackSize)
            self.stackLength = [Int](repeating:0, count: self.stackCount)
        }
        
        func push(_ stackNum: Int, _ value: Int) {
            // 判断stackNum的合法性
            if !self.isStackNumValid(stackNum) {
                return
            }
            // 判断是否栈满
            if self.stackLength[stackNum] >= stackSize {
                return
            }
            // 压入元素
            let len = self.stackLength[stackNum]
            self.stack[stackNum * stackSize + len] = value
            self.stackLength[stackNum] = len + 1
        }
        
        func pop(_ stackNum: Int) -> Int {
            // 判断stackNum的合法性
            if !self.isStackNumValid(stackNum) {
                return  -1
            }
            // 判断是否栈空
            if self.stackLength[stackNum] <= 0 {
                return -1
            }
            // 弹出元素
            let len = self.stackLength[stackNum]
            let val = self.stack[stackNum * stackSize + len - 1]
            self.stackLength[stackNum] = len - 1
            return val
        }
        
        func peek(_ stackNum: Int) -> Int {
            // 判断stackNum的合法性
            if !self.isStackNumValid(stackNum) {
                return  -1
            }
            // 判断是否栈空
            if self.stackLength[stackNum] <= 0 {
                return -1
            }
            // 获取栈顶元素
            let len = self.stackLength[stackNum]
            return self.stack[stackNum * stackSize + len - 1]
        }
        
        func isEmpty(_ stackNum: Int) -> Bool {
            // 判断stackNum的合法性
            if !self.isStackNumValid(stackNum) {
                return false
            }
            // 判断栈是否空
            return self.stackLength[stackNum] == 0
        }
        
        func isStackNumValid(_ stackNum: Int) -> Bool {
            return stackNum >= 0 && stackNum <= (stackCount - 1)
        }
    }
}
