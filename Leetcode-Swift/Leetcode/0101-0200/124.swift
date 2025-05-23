//
//  124.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/23.
//

import Foundation

/*
 124. 二叉树中的最大路径和 (困难)
 https://leetcode-cn.com/problems/binary-tree-maximum-path-sum/
 */

class Solution_124 {
    var ans = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let sum = preorder(root)

        return max(sum, ans)
    }

    func preorder(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let left = max(preorder(root?.left), 0)
        let right = max(preorder(root?.right), 0)
        let sum = root!.val + left + right

        ans = max(sum, ans)

        return root!.val + max(left, right)
    }
}
