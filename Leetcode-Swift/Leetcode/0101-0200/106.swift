//
//  106.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/26.
//

import Foundation

/*
 106. 从中序与后序遍历序列构造二叉树 (中等)
 https://leetcode-cn.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
 */

class Solution_106 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.isEmpty || postorder.isEmpty {
            return nil
        }

        let leftCount = inorder.count
        let rightCount = postorder.count

        if leftCount != rightCount {
            return nil
        }

        return buildTreeCore(inorder, 0, leftCount - 1, postorder, 0, rightCount - 1)

    }

    func buildTreeCore(_ inorder: [Int], _ i: Int, _ j: Int, _ postorder: [Int], _ p: Int, _ q: Int) -> TreeNode? {
        if i > j || p > q {
            return nil
        }

        if i == j && p == q {
            if inorder[i] == postorder[q] {
                return TreeNode(inorder[i])
            }
            return nil
        }

        let rootVal = postorder[q]
        var leftTreeCount = 0

        for k in i...j {
            if inorder[k] == rootVal {
                break
            }
            leftTreeCount += 1
        }

        let leftTree = buildTreeCore(inorder, i, i + leftTreeCount - 1, postorder, p, p + leftTreeCount - 1)
        let rightTree = buildTreeCore(inorder, i + leftTreeCount + 1, j, postorder,p + leftTreeCount, q - 1)

        let root = TreeNode(rootVal)
        root.left = leftTree
        root.right = rightTree

        return root
    }
}
