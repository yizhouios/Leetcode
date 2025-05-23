//
//  17.12.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/13.
//

import Foundation

/*
 面试题 17.12. BiNode (简单)
 https://leetcode-cn.com/problems/binode-lcci/
 */

class Solution_Jindian_17_12 {
    /// 递归
    func convertBiNode(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }

        let dummyNode: TreeNode? = TreeNode(0)
        var tail = dummyNode
        inorder(root, &tail)

        return dummyNode?.right
    }

    func inorder(_ root: TreeNode?, _ tail: inout TreeNode?) {
        if root == nil {
            return
        }

        let left = root?.left
        let right = root?.right

        inorder(left, &tail)

        tail?.right = root
        root?.left = nil
        tail = tail?.right

        inorder(right, &tail)
    }
    
    /// 迭代解法
    func convertBiNode_1(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }

        let dummyNode: TreeNode? = TreeNode(0)
        var tail = dummyNode

        var node = root
        var stack = [TreeNode?]()

        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node)
                node = node?.left
            }

            node = stack.removeLast()
            let right = node?.right
            
            node?.left = nil
            node?.right = nil
            tail?.right = node
            tail = tail?.right

            node = right
        }

        return dummyNode?.right
    }
    
    /*
     测试用例：
     1. 功能：满二叉搜索树、都在左/右子树的二叉搜索树、普通二叉搜索树
     2. 特殊：只有1个节点的二叉树搜索树
     */
    func test() {
        
    }
}
