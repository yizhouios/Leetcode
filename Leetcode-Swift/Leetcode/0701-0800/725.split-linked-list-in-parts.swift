//
//  725.split-linked-list-in-parts.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/20.
//

import Foundation

/*
 725. 分隔链表 (中等)
 https://leetcode-cn.com/problems/split-linked-list-in-parts/
 */

class Solution_725 {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {        
        var count = 0
        var node = head
        while node != nil {
            count += 1
            node = node?.next
        }
        
        var intervals = [Int]()
        if count <= k {
            var k = k
            var index = count
            while index > 0 {
                intervals.append(1)
                k -= 1
                index -= 1
            }
            while k > 0 {
                intervals.append(0)
                k -= 1
            }
        } else {
            let interval = count / k
            while count > 0 {
                if count >= interval {
                    count -= interval
                    intervals.append(interval)
                } else {
                    intervals.append(count)
                    break
                }
            }
        }
        
        if intervals.count > k {
            var total = 0
            var index = intervals.count - k
            while index > 0 {
                total += intervals.removeLast()
                index -= 1
            }
            
            for i in 0..<total {
                intervals[i] += 1
            }
        }
        
//        print(intervals)
        
        var ans = [ListNode?]()
        var head = head
        for var i in intervals {
            if i == 0 {
                ans.append(nil)
                continue
            }
            var cur = head
            while i > 1 {
                cur = cur?.next
                i -= 1
            }
            ans.append(head)
            head = cur?.next
            cur?.next = nil
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：k大于元素个数、等于元素个数、小于元素个数
     2. 特殊：空，仅1个元素
     */
    func test() {
        let tests = [
            ([1], 1),
            ([1,2,3], 5),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 2),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 4),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 6),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 7),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 8),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 9),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 10),
            ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 11),
            
            ([], 3)
        ]
        
        for i in tests {
            print(splitListToParts(createListNode(values: i.0), i.1))
//            for j in splitListToParts(createListNode(values: i.0), i.1) {
//                printListNode(rootNode: j)
//            }
        }
    }
}
