//
//  52.liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/24.
//

import Foundation

/*
 剑指 Offer 52. 两个链表的第一个公共节点 (简单)
 https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/
 
 本题与主站 160 题相同：https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
 */

class Solution_Offer_52 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        
        let countA = listNodeCount(headA)
        let countB = listNodeCount(headB)
        
        var pHeadOfLong = headA
        var pHeadOfShort = headB
        var lengOfDif = countA - countB
        if countB > countA {
            pHeadOfLong = headB
            pHeadOfShort = headA
            lengOfDif = countB - countA
        }
        while lengOfDif > 0 {
            pHeadOfLong = pHeadOfLong?.next
            lengOfDif -= 1
        }
        
        while pHeadOfShort != nil && pHeadOfLong != nil && pHeadOfShort !== pHeadOfLong {
            pHeadOfShort = pHeadOfShort?.next
            pHeadOfLong = pHeadOfLong?.next
        }
        
        return pHeadOfLong
    }
    
    func listNodeCount(_ head: ListNode?) -> Int {
        if head == nil {
            return 0
        }
        var pNode = head
        var ans = 0
        while pNode != nil {
            ans += 1
            pNode = pNode?.next
        }
        return ans
    }
    
    /*
     测试用例：
     1. 功能测试：有公共节点（公共节点在第一个；中间；最后一个）；没有公共节点
     2. 特殊输入测试：空指针
     */
    func test() {
        
    }
}


/*
 JavaScript
 
 /**
  * Definition for singly-linked list.
  * function ListNode(val) {
  *     this.val = val;
  *     this.next = null;
  * }
  */

 /**
  * @param {ListNode} headA
  * @param {ListNode} headB
  * @return {ListNode}
  */
 var getIntersectionNode = function(headA, headB) {
     if (!headA || !headB) {
         return null
     }

     var listnodeCount = (head) => {
         if (!head) {
             return null
         }
         var node = head
         let length = 0;
         while (node) {
             ++length;
             node = node.next;
         }
         return length
     }

     let lengthA = listnodeCount(headA);
     let lengthB = listnodeCount(headB);

     let diff = 0,
         slow,
         fast;
     if (lengthA > lengthB) {
         slow = headA;
         fast = headB;
         diff = lengthA - lengthB;
     } else {
         slow = headB;
         fast = headA;
         diff = lengthB - lengthA;
     }

     while (diff--) {
         slow = slow.next;
     }

     while (slow !== fast) {
         slow = slow.next;
         fast = fast.next;
     }

     return slow;
 };
 */
