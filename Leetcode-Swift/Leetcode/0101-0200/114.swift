//
//  114.flatten-binary-tree-to-linked-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/29.
//

import Foundation

/*
 114. 二叉树展开为链表 (中等)
 https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list/
 */

class Solution_114 {
    
    /// 非递归
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }

        let dummyNode: TreeNode? = TreeNode(0)
        var tail = dummyNode

        var node = root
        var stack = [TreeNode?]()

        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node?.right)

                let next = node?.left
                node?.left = nil
                tail?.right = node
                tail = node
                node = next
            }

            node = stack.removeLast()
        }

        dummyNode?.right = nil
    }
    
    /// 递归
    func flatten_1(_ root: TreeNode?) {
        let dummyNode: TreeNode? = TreeNode(0)
        var tail = dummyNode

        preOrder(root, &tail)

        dummyNode?.right = nil
    }

    func preOrder(_ root: TreeNode?, _ tail: inout TreeNode?) {
        if root == nil {
            return
        }

        let left = root?.left
        let right = root?.right

        tail?.right = root
        root?.left = nil
        tail = root

        preOrder(left, &tail)
        preOrder(right, &tail)
    }
    
    func test() {
        let tests = [
            createTreeNode([1,2,5,3,4,nil,6]),
            nil,
            createTreeNode([0])
        ]
        
        for i in tests {
            flatten(i)
            print(i?.levelOrder() ?? 0)
        }
    }
}
