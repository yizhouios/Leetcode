//
//  141..swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/3.
//

import Foundation
/*
 141. 环形链表 (简单)
 https://leetcode-cn.com/problems/linked-list-cycle/
 */

class Solution_141 {
    // 思路：快慢指针
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head?.next
        while fast !== slow {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow != nil
        /*
         原：
         var low = head, fast = head?.next
         while fast != nil {
             if low === fast {
                 return true
             }
             low = low?.next
             fast = fast?.next?.next
         }
         return false
         */
    }
    
    /*
     测试用例：
     1. 有环：节点数为1个、多个的情况
     2. 无环：节点数为1个、多个的情况
     3. 空
     */
    func test() {
        let node5 = ListNode(5)
        node5.next = node5
        
        let node4 = ListNode(4, node5)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2, node3)
        node4.next = node2
        
        let node1 = ListNode(1)
        let node1_1 = ListNode(11)
        let node1_2 = ListNode(12, node1_1)
        
        print(hasCycle(node5))
        print(hasCycle(node2))
        print(hasCycle(node1))
        print(hasCycle(node1_2))
        print(hasCycle(nil))
    }
}
