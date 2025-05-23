//
//  02.06.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/14.
//

import Foundation

/*
 面试题 02.06. 回文链表 (简单)
 https://leetcode-cn.com/problems/palindrome-linked-list-lcci/
 */

class Solution_Jindian_02_06 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
            return true
        }
        
        let first_half_end = end_of_first_half(head)
        let second_half_start = reverse_list(first_half_end?.next)
        
        var first_position = head
        var second_position = second_half_start
        var ans = true
        while ans && second_position != nil {
            if first_position?.val != second_position?.val {
                ans = false
            }
            first_position = first_position?.next
            second_position = second_position?.next
        }
        
        first_half_end?.next = reverse_list(second_half_start)
        
        return ans
    }
    
    func end_of_first_half(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    func reverse_list(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    
    func test() {
        print(isPalindrome(createListNode(values: [1,2,2,1])))
        print(isPalindrome(createListNode(values: [1,2,3,2,1])))
        print(isPalindrome(createListNode(values: [1,2,1])))
        print(isPalindrome(createListNode(values: [1,1])))
        print(isPalindrome(createListNode(values: [1])))
        print(isPalindrome(createListNode(values: [])))
    }
}
