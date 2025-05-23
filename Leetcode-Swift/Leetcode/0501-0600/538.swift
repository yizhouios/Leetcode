//
//  538.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/15.
//

import Foundation

/*
 538. 把二叉搜索树转换为累加树 (中等)
 https://leetcode-cn.com/problems/convert-bst-to-greater-tree/
 */

class Solution_538 {
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }

        var node = root
        var preVal = 0
        var stack = [TreeNode?]()

        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node)
                node = node?.right
            }

            node = stack.removeLast()
            preVal = preVal + node!.val
            node!.val = preVal

            node = node?.left
        }

        return root
    }
}
