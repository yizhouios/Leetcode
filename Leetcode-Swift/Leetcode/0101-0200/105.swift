//
//  105.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/25.
//

import Foundation

/*
 105. 从前序与中序遍历序列构造二叉树 (中等)
 https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
 */

class Solution_105 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty {
            return nil
        }

        if preorder.count != inorder.count {
            return nil
        }

        return buildTreeCore(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }

    func buildTreeCore(_ preorder: [Int], _ i: Int, _ j: Int, _ inorder: [Int], _ p: Int, _ q: Int) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty {
            return nil
        }
        if i > j || p > q {
            return nil
        }

        let rootVal = preorder[i]
        var rootValIndexInInorder = -1
        for i in p...q {
            if inorder[i] == rootVal {
                rootValIndexInInorder = i
                break
            }
        }

        let leftInorderCount = rootValIndexInInorder - p
        let leftEndIndexInPreorder = i + leftInorderCount

        let leftTree = buildTreeCore(preorder, i + 1, leftEndIndexInPreorder, inorder, p, rootValIndexInInorder - 1)
        let rightTree = buildTreeCore(preorder, leftEndIndexInPreorder + 1, j, inorder, rootValIndexInInorder + 1, q)

        let rootNode = TreeNode(rootVal)
        rootNode.left = leftTree
        rootNode.right = rightTree

        return rootNode
    }
}
