//
//  1290.convert-binary-number-in-a-linked-list-to-integer.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/7.
//

import Foundation

/*
 1290. 二进制链表转整数 (简单)
 https://leetcode-cn.com/problems/convert-binary-number-in-a-linked-list-to-integer/
 */

class Solution_1290 {
    func getDecimalValue(_ head: ListNode?) -> Int {
        if head == nil {
            return 0
        }
        
        var nums = [Int]()
        var node = head
        while node != nil {
            nums.append(node!.val)
            node = node?.next
        }
        
        var sum = 0
        var base = 1
        for i in nums.reversed() {
            sum += (i * base)
            base *= 2
        }
        
        return sum
    }
    
    /*
     测试用例：
     1. 仅1个节点（0、1）、多个节点
     2. 空链表
     */
    func test() {
        let tests = """
[0]
[0,1,0]
[1,1,1]
[1,1,0,1]
[1,0,0,0]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            print(getDecimalValue(createListNode(values: i)))
        }
    }
}
