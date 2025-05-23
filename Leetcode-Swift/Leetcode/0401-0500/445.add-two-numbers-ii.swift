//
//  445.add-two-numbers-ii.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/18.
//

import Foundation

/*
 445. 两数相加 II (中等)
 https://leetcode-cn.com/problems/add-two-numbers-ii/
 */

class Solution_445 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var stackl1 = [ListNode]()
        var stackl2 = [ListNode]()
        var node = l1
        while node != nil {
            stackl1.append(node!)
            node = node?.next
        }
        node = l2
        while node != nil {
            stackl2.append(node!)
            node = node?.next
        }
        
        var head: ListNode? = nil
        var carry = false
        while !stackl1.isEmpty && !stackl2.isEmpty {
            let node1 = stackl1.removeLast()
            let node2 = stackl2.removeLast()
            var val = node1.val + node2.val
            val += (carry ? 1 : 0)
            carry = false
            
            if val >= 10 {
                carry = true
                val -= 10
            }
            let newHead = ListNode(val)
            newHead.next = head
            head = newHead
        }
        
        var stack = stackl1.isEmpty ? stackl2 : stackl1
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            var val = node.val
            val += (carry ? 1 : 0)
            carry = false
            
            if val >= 10 {
                val -= 10
                carry = true
            }
            let newHead = ListNode(val)
            newHead.next = head
            head = newHead
        }
        
        if carry {
            let newHead = ListNode(1)
            newHead.next = head
            head = newHead
        }
        
        return head
    }
    
    /*
     测试用例：
     1. 功能：和0相加、个位数+多位数、含进位（最左侧有进位、中间进位、各位进位）、不含进位
     2. 特殊：其中一个为空、两个都为空
     */
    func test() {
        let tests = [
            ([0], [1,2,3]),
            ([9], [1,2,3]),
            ([8], [1,1,1]),
            ([8], [9,9,2]),
            ([8], [9,5,2]),
            ([1,2,3], [3,4,5]),
        ]
        for i in tests {
            printListNode(rootNode: addTwoNumbers(createListNode(values: i.0), createListNode(values: i.1)))
        }
    }
}
