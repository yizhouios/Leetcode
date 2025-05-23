//
//  889.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/26.
//

import Foundation

/*
 889. 根据前序和后序遍历构造二叉树 (中等)
 https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/
 */

class Solution_889 {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || postorder.isEmpty {
            return nil
        }

        if preorder.count != postorder.count {
            return nil
        }

        return constructFromPrePostCore(preorder, 0, preorder.count - 1, postorder, 0, postorder.count - 1)
    }

    func constructFromPrePostCore(_ preorder: [Int], _ i: Int, _ j: Int, _ postorder: [Int], _ p: Int, _ q: Int) -> TreeNode? {
        if i > j || p > q {
            return nil
        }

        if i == j && p == q {
            if preorder[i] == postorder[q] {
                return TreeNode(preorder[i])
            }
            return nil
        }

        let rootVal = preorder[i]
        var leftTreeNodeCount = 0
        for k in p...q {
            leftTreeNodeCount += 1
            if postorder[k] == preorder[i + 1] {
                break
            }
        }

        let leftTree = constructFromPrePostCore(preorder, i + 1, i + leftTreeNodeCount, postorder, p, p + leftTreeNodeCount - 1)
        let rightTree = constructFromPrePostCore(preorder, i + leftTreeNodeCount + 1, j, postorder, p + leftTreeNodeCount, q - 1)

        let root = TreeNode(rootVal)
        root.left = leftTree
        root.right = rightTree

        return root
    }
}
