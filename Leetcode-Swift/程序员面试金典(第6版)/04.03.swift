//
//  04.03.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/16.
//

import Foundation

/*
 面试题 04.03. 特定深度节点链表 (中等)
 https://leetcode-cn.com/problems/list-of-depth-lcci/
 */

class Solution_Jindian_04_03 {
    
    func listOfDepth(_ tree: TreeNode?) -> [ListNode?] {
        if tree == nil {
            return []
        }

        var ans = [ListNode?]()
        var queue = [tree]

        while !queue.isEmpty {
            var count = queue.count

            let dummyNode = ListNode(0)
            var tail = dummyNode

            while count > 0 {
                let node = queue.removeFirst()
                if node?.left != nil {
                    queue.append(node?.left)
                }
                if node?.right != nil {
                    queue.append(node?.right)
                }

                let lNode = ListNode(node!.val)
                tail.next = lNode
                tail = lNode

                count -= 1
            }

            ans.append(dummyNode.next)
        }

        return ans
    }
    
    func test() {
        for i in listOfDepth(createTreeNode([1,2,3,4,5,nil,7,8,nil,nil,nil,nil,nil])) {
            printListNode(rootNode: i)
        }
    }
}
