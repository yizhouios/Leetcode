//
//  22.lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/7.
//

import Foundation

/*
 剑指 Offer 22. 链表中倒数第k个节点 (简单)
 https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
 */

class Solution_Offer_22 {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 参数校验
        if head == nil {
            return nil
        }
        
        // 定义fast快指针，先走k步
        var fast = head
        var val = k
        while val > 0 {
            if fast == nil {
                return nil
            }
            fast = fast?.next
            val -= 1
        }
        
        // 定义slow慢指针（然后快慢指针一起走，直到快指针为空，慢指针即为倒数第k个节点）
        var slow = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
    
    func getKthFromEnd_old(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k <= 0 {
            return nil
        }
        
        var fast = head
        var k = k - 1
        while fast != nil && k > 0 {
            fast = fast?.next
            k -= 1
        }
        if k == 0 {
            var ans = head
            while fast?.next != nil {
                fast = fast?.next
                ans = ans?.next
            }
            return ans
        }
        return nil
    }
    
    /*
     测试用例：
     1. 功能测试：k为中间值、倒数第1个、倒数最后1个
     2. 特殊输入：k大于节点个数、链表头结点为空
     */
    func test() {
        print(getKthFromEnd(createListNode(values: [1,2,3,4,5]), 2)?.val ?? "")
        print(getKthFromEnd(createListNode(values: [1,2,3,4,5]), 1)?.val ?? "")
        print(getKthFromEnd(createListNode(values: [1,2,3,4,5]), 5)?.val ?? "")
        print(getKthFromEnd(createListNode(values: [1,2,3,4,5]), 6)?.val ?? "")
        print(getKthFromEnd(nil, 2)?.val ?? "")
    }
}
