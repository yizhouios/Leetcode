//
//  31.zhan-de-ya-ru-dan-chu-xu-lie-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/10.
//

import Foundation

/*
 剑指 Offer 31. 栈的压入、弹出序列 (中等)
 https://leetcode-cn.com/problems/zhan-de-ya-ru-dan-chu-xu-lie-lcof/
 */

class Solution_Offer_31 {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        // 参数校验
        if pushed.isEmpty || popped.isEmpty {
            return true
        }
        if pushed.count != popped.count {
            return false
        }
        
        var poppedQueue = popped
        
        var stack = [Int]()
        for i in pushed {
            if i == poppedQueue.first! {
                poppedQueue.removeFirst()
            } else {
                while !stack.isEmpty && !poppedQueue.isEmpty {
                    if stack.last! != poppedQueue.first! {
                        break
                    }
                    stack.removeLast()
                    poppedQueue.removeFirst()
                }
                stack.append(i)
            }
        }
        
        while !stack.isEmpty && !poppedQueue.isEmpty {
            if stack.removeLast() != poppedQueue.removeFirst() {
                return false
            }
        }
        
        return stack.isEmpty && poppedQueue.isEmpty
    }
    
    /*
     测试用例：
     1. 功能测试：
        * 是弹出序列：有多个数；只有1个数;两个数组全等
        * 不是弹出序列：有多个数；只有1个数；两个数组全不等
     2. 特殊输入测试：空数组
     */
    func test() {
        print(validateStackSequences([1,2,3,4,5], [4,5,3,2,1]))
        print(validateStackSequences([1,2,3,4,5], [4,5,3,2]))
        print(validateStackSequences([1,2,3,4,5], [1,2,3,4,5]))
        print(validateStackSequences([1,2,3,4,5], [11,22,33,44,55]))
        print(validateStackSequences([], []))
        print(validateStackSequences([1], [1]))
        print(validateStackSequences([1], [3]))
    }
}
